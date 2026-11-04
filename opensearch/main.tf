locals {
  availability_zone_count = (
    var.data_node_count >= 3 ? 3 :
    var.data_node_count >= 2 ? 2 :
    1
  )

  # Logic for "t" family instance types as they don't support auto-tuning or storage > 200 GB
  volume_size    = var.high_availability == true ? (startswith(var.data_node_type, "t") ? 200 : 500) : 60
  auto_tune_mode = startswith(var.data_node_type, "t") ? "DISABLED" : "ENABLED"
}

# This block retrieves the current AWS account information
data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
data "aws_partition" "current" {}

# This block creates a security group for OpenSearch
resource "aws_security_group" "opensearch" {
  name        = "${var.cluster_name}-sg"
  description = "Allow HTTPS access to OpenSearch from same SG"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTPS from self"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    self        = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

# This block deploys the OpenSearch cluster
module "opensearch" {
  source  = "terraform-aws-modules/opensearch/aws"
  version = "1.7.0"

  domain_name    = var.cluster_name
  engine_version = var.opensearch_version

  # Cluster security
  domain_endpoint_options = {
    enforce_https       = true
    tls_security_policy = var.opensearch_tls_security_policy
  }

  node_to_node_encryption = {
    enabled = true
  }

  encrypt_at_rest = {
    enabled    = true
    kms_key_id = var.opensearch_encryption_key_arn
  }

  software_update_options = {
    auto_software_update_enabled = false
  }

  access_policy_statements = [
    {
      sid    = "domainAccessPolicies"
      effect = "Allow"

      principals = [{
        type        = "AWS"
        identifiers = ["*"]
      }]

      actions = ["es:*"]

      resources = [
        "arn:${data.aws_partition.current.partition}:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.cluster_name}/*"
      ]
    }
  ]

  advanced_security_options = {
    enabled = false
  }

  create_security_group = false

  # Cluster configuration
  cluster_config = merge(
    {
      instance_count           = var.data_node_count
      instance_type            = var.data_node_type
      dedicated_master_enabled = var.high_availability
      dedicated_master_count   = var.high_availability ? 3 : null
      dedicated_master_type    = var.high_availability ? var.master_node_type : null
      zone_awareness_enabled   = var.data_node_count > 1
    },
    var.data_node_count > 1 ? {
      zone_awareness_config = {
        availability_zone_count = local.availability_zone_count
      }
    } : {}
  )


  ebs_options = {
    ebs_enabled = true
    volume_type = "gp3"
    iops        = 3000
    volume_size = local.volume_size
    throughput  = var.high_availability == true ? 250 : 125
  }

  auto_tune_options = {
    desired_state = local.auto_tune_mode

    maintenance_schedule = [
      {
        start_at                       = var.auto_tune_maintenance_start_at
        cron_expression_for_recurrence = "cron(0 0 ? * 1 *)"
        duration = {
          value = "2"
          unit  = "HOURS"
        }
      }
    ]

    rollback_on_disable = "NO_ROLLBACK"
  }

  advanced_options = {
    "rest.action.multi.allow_explicit_index" = "true"
  }

  # Cluster networking
  vpc_endpoints = {
    one = {
      subnet_ids = var.private_subnets
    }
  }

  vpc_options = {
    subnet_ids         = var.private_subnets
    security_group_ids = [aws_security_group.opensearch.id]
  }

  # Cluster logging
  log_publishing_options = [
    { log_type = "INDEX_SLOW_LOGS" },
    { log_type = "SEARCH_SLOW_LOGS" },
  ]

  tags = var.tags
}