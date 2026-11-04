module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.0"

  deletion_window_in_days  = var.kms_deletion_window_in_days
  description              = var.kms_description
  enable_key_rotation      = var.kms_enable_key_rotation
  is_enabled               = var.kms_is_enabled
  key_usage                = var.kms_key_usage
  customer_master_key_spec = var.kms_customer_master_key_spec
  policy                   = var.kms_policy
  aliases                  = var.kms_aliases
  tags                     = var.tags
}