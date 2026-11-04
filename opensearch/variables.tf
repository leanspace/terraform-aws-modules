variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_name" {
  description = "Name of the Opensearch cluster"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "data_node_count" {
  description = "Number of data nodes"
  type        = number
}

variable "data_node_type" {
  description = "Instance type for data nodes"
  type        = string
}

variable "master_node_type" {
  description = "Instance type for master nodes"
  type        = string
}

variable "opensearch_encryption_key_arn" {
  description = "Arn of kms key for encrypting OpenSearch data at rest"
  type        = string
}

variable "opensearch_version" {
  description = "Version of OpenSearch to deploy"
  type        = string
  default     = "OpenSearch_2.11"
}

variable "opensearch_tls_security_policy" {
  description = "TLS security policy for OpenSearch"
  type        = string
  default     = "Policy-Min-TLS-1-2-2019-07"
}

variable "high_availability" {
  description = "Enable high availability for the OpenSearch cluster"
  type        = bool
}

variable "auto_tune_maintenance_start_at" {
  description = <<-EOT
    Start time (RFC3339) for Auto-Tune's first scheduled maintenance window;
    subsequent occurrences follow cron_expression_for_recurrence in main.tf, so
    this only matters as the seed for that first occurrence. AWS rejects a
    start_at that's already in the past, so this defaults far enough in the
    future to never go stale - previously a hardcoded near-term date here
    caused CreateDomain to fail once that date passed. Override only if the
    exact first-occurrence time actually matters for your use case.
  EOT
  type        = string
  default     = "2099-01-01T00:00:00Z"
}