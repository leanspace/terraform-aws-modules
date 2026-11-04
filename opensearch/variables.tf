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