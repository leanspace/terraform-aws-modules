variable "bucket_name" {
  description = "The name of the bucket"
  type        = string
}

variable "versioning_enabled" {
  description = "Whether versioning is enabled on the bucket"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable"
  type        = bool
  default     = false
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
  type        = string
  default     = "aws:kms"
}

variable "kms_key_arn" {
  description = "ARN of the KMS key to use when sse_algorithm is aws:kms. Leave null to use the AWS-managed aws/s3 key"
  type        = string
  default     = null
}

variable "lifecycle_rule" {
  description = "List of maps containing configuration of object lifecycle management, passed through as-is to the underlying terraform-aws-modules/s3-bucket/aws module's lifecycle_rule variable"
  type        = any
  default     = []
}

variable "policy_json" {
  description = "Full JSON bucket policy document to attach. Leave null to attach no bucket policy"
  type        = string
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
