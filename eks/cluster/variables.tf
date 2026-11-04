variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "eks_log_types" {
  description = "List of EKS control plane log types to enable"
  type        = list(string)
  default     = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "kube_proxy_addon_version" {
  description = "Kube Proxy addon version"
  type        = string
}

variable "vpc_cni_addon_version" {
  description = "VPC CNI addon version"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster will be deployed"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "eks_private_access" {
  description = "Whether the EKS API server endpoint is reachable from within the VPC"
  type        = bool
  default     = false
}

variable "eks_public_access_cidrs" {
  description = "List of CIDR blocks for public access to the EKS cluster"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "eks_pod_identity_agent_addon_version" {
  description = "EKS Pod Identity Agent addon version"
  type        = string
}

variable "node_security_group_tags" {
  description = "Extra tags for the auto-created node security group (null value removes a tag)"
  type        = map(string)
  default     = {}
}