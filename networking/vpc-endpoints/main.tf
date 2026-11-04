module "vpc_endpoints" {
  source  = "terraform-aws-modules/vpc/aws//modules/vpc-endpoints"
  version = "5.19.0"

  vpc_id                     = var.vpc_id
  create_security_group      = true
  security_group_name_prefix = "vpc-endpoints"
  security_group_description = "VPC endpoint security group"
  security_group_rules = {
    ingress_https = {
      description = "HTTPS from VPC"
      cidr_blocks = [var.vpc_cidr_block]
    }
  }
  endpoints = var.endpoints
  tags = merge(var.tags, {
    Endpoint = "true"
  })
}