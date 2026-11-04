locals {
  base_labels = {
    lifecycle   = var.node_capacity_type
    environment = var.environment
  }

  merged_labels = merge(local.base_labels, var.extra_node_group_labels)

  # terraform-aws-modules/eks managed node group expects a map of taints.
  taints_map = {
    for t in var.node_group_taints : "${t.key}=${t.value}" => {
      key    = t.key
      value  = t.value
      effect = t.effect
    }
  }
}

module "eks_managed_node_group" {
  source  = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
  version = "20.36.0"

  name            = var.node_group_name
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  subnet_ids           = var.private_subnets
  cluster_service_cidr = var.cluster_service_cidr

  cluster_primary_security_group_id = var.cluster_primary_security_group_id
  vpc_security_group_ids            = var.vpc_security_group_ids

  min_size     = var.minimum_node_count
  max_size     = var.maximum_node_count
  desired_size = var.desired_node_count

  instance_types = var.node_instance_types
  capacity_type  = var.node_capacity_type

  iam_role_additional_policies = var.iam_role_additional_policies

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
  }

  labels = local.merged_labels

  taints = local.taints_map
  tags   = var.tags
}