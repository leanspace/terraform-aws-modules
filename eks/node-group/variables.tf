variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "minimum_node_count" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
}

variable "maximum_node_count" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
}

variable "desired_node_count" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
}

variable "node_instance_types" {
  description = "List of instance types for the EKS node group"
  type        = list(string)
}

variable "node_capacity_type" {
  description = "Capacity type for the EKS node group (e.g., ON_DEMAND, SPOT)"
  type        = string
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "private_subnets" {
  description = "List of private subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_primary_security_group_id" {
  description = "Security group ID for the EKS cluster"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "Security group ID for the EKS node group"
  type        = list(string)
}

variable "environment" {
  description = "Environment for the EKS node group (e.g., dev, prod)"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.32"
}

variable "cluster_service_cidr" {
  description = "CIDR block for the EKS cluster service"
  type        = string
  default     = ""
}

variable "extra_node_group_labels" {
  description = "Additional labels to apply to the EKS managed node group"
  type        = map(string)
  default     = {}
}

variable "node_group_taints" {
  description = "Taints to apply to the nodes in the managed node group"
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}


variable "iam_role_additional_policies" {
  description = <<-EOT
    Extra IAM policies to attach to the node IAM role, as a map of key => policy ARN. Pods can
    reach the node role through IMDS, so keep this minimal and give controllers their own
    IRSA/Pod Identity roles instead. The upstream module already attaches
    AmazonEKSWorkerNodePolicy, AmazonEKS_CNI_Policy and AmazonEC2ContainerRegistryReadOnly; they
    are repeated here under the WORKNODEPOLICY/EKSCNI/ECR keys only because existing node groups
    attach them under those keys, and dropping a key detaches the policy from the role.
  EOT
  type        = map(string)
  nullable    = false
  default = {
    SSM            = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    WORKNODEPOLICY = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    EKSCNI         = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    ECR            = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  }
}

variable "metadata_http_put_response_hop_limit" {
  description = "IMDSv2 hop limit on the nodes. 1 blocks pods (non-hostNetwork) from reaching IMDS and the node role credentials; 2 lets pods reach it. Changing it rolls the node group"
  type        = number
  default     = 1

  validation {
    condition     = var.metadata_http_put_response_hop_limit >= 1 && var.metadata_http_put_response_hop_limit <= 64
    error_message = "metadata_http_put_response_hop_limit must be between 1 and 64."
  }
}
