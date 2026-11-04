module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 3.0"

  bucket        = var.bucket_name
  force_destroy = var.force_destroy

  versioning = {
    enabled = var.versioning_enabled
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = var.sse_algorithm
        kms_master_key_id = var.kms_key_arn
      }
    }
  }

  lifecycle_rule = var.lifecycle_rule

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  attach_policy = var.policy_json != null
  policy        = var.policy_json

  tags = var.tags
}
