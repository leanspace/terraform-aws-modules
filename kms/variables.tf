variable "kms_deletion_window_in_days" {
  description = "Duration in days after which the key is deleted after destruction of the resource"
  type        = number
  default     = 7
}

variable "kms_description" {
  description = "Description for the KMS key"
  type        = string
  default     = null
}

variable "kms_enable_key_rotation" {
  description = "Specifies whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "kms_is_enabled" {
  description = "Specifies whether the key is enabled"
  type        = bool
  default     = true
}

variable "kms_key_usage" {
  description = "Specifies the intended use of the key"
  type        = string
  default     = "ENCRYPT_DECRYPT"
}

variable "kms_customer_master_key_spec" {
  description = "Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms"
  type        = string
  default     = "SYMMETRIC_DEFAULT"
}

variable "kms_policy" {
  description = "Full JSON policy to apply to the KMS key"
  type        = string
}

variable "kms_aliases" {
  description = "List of aliases to create for the key"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of tags to apply to the KMS key"
  type        = map(string)
  default     = {}
}


