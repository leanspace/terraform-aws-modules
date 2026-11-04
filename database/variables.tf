variable "aurora_name" {
  description = "Name of the Aurora cluster"
  type        = string
}

variable "engine" {
  description = "The name of the database engine to be used for this DB cluster. Defaults to `aurora`. Valid Values: `aurora`, `aurora-mysql`, `aurora-postgresql`"
  type        = string
  default     = "aurora-postgresql"
}

variable "aurora_engine_version" {
  description = "Aurora PostgreSQL engine version"
  type        = string
}

variable "aurora_master_username" {
  description = "Master username"
  type        = string
  default     = "root"
}

variable "storage_encrypted" {
  description = "Specifies whether the DB cluster is encrypted. The default is `true`"
  type        = bool
  default     = true
}

variable "kms_key_id" {
  description = "The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true`"
  type        = string
  default     = null
}

variable "aurora_storage_type" {
  description = "Aurora storage type"
  type        = string
  default     = "aurora-iopt1"
}

variable "aurora_allow_major_version_upgrade" {
  description = "Allow major version upgrades"
  type        = bool
  default     = true
}

variable "aurora_instances" {
  description = "Map of Aurora instances"
  type        = map(any)
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "create_db_subnet_group" {
  description = "Determines whether to create the database subnet group or use existing"
  type        = bool
  default     = true
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "security_group_rules" {
  description = "Rules for the security group"
  type        = any
}

variable "security_group_tags" {
  description = "Additional tags for the security group"
  type        = map(string)
  default     = {}
}

variable "enabled_cloudwatch_logs_exports" {
  type    = list(string)
  default = ["postgresql"]
}

variable "apply_immediately" {
  type    = bool
  default = true
}


variable "copy_tags_to_snapshot" {
  type    = bool
  default = true
}

variable "final_snapshot_identifier" {
  type = string
}

variable "skip_final_snapshot" {
  type    = bool
  default = false
}

variable "deletion_protection" {
  type    = bool
  default = true
}

variable "iam_database_authentication_enabled" {
  type    = bool
  default = true
}

variable "engine_lifecycle_support" {
  type    = string
  default = "open-source-rds-extended-support"
}

variable "create_db_cluster_parameter_group" {
  description = "Determines whether a cluster parameter should be created or use existing"
  type        = bool
  default     = true
}

variable "db_cluster_parameter_group_name" {
  description = "Name of the DB cluster paramater group"
  type        = string
}

variable "db_cluster_parameter_group_family" {
  type    = string
  default = "aurora-postgresql14"
}

variable "db_cluster_parameter_group_description" {
  type    = string
  default = "Aurora DB cluster Parameter Group"
}

variable "db_cluster_parameter_group_parameters" {
  description = "List of parameters for the DB cluster parameter group"
  type = list(object({
    name         = string
    value        = any
    apply_method = string
  }))
  default = [
    {
      name         = "rds.force_ssl"
      value        = 1
      apply_method = "immediate"
    }
  ]
}

variable "create_db_parameter_group" {
  description = "Determines whether a DB parameter should be created or use existing"
  type        = bool
  default     = true
}

variable "db_parameter_group_name" {
  description = "Name of the DB paramater group"
  type        = string
}

variable "db_parameter_group_family" {
  type    = string
  default = "aurora-postgresql14"
}

variable "db_parameter_group_description" {
  type    = string
  default = "Aurora PG Parameter Group"
}

variable "db_parameter_group_parameters" {
  type = list(any)
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "create_cloudwatch_log_group" {
  description = "Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports`"
  type        = bool
  default     = true
}

variable "cloudwatch_log_group_kms_key_id" {
  description = "The ARN of the KMS Key to use when encrypting log data"
  type        = string
  default     = null
}

variable "cloudwatch_log_group_class" {
  type    = string
  default = "STANDARD"
}

variable "master_user_password_rotation_days" {
  type    = number
  default = "90"
}


