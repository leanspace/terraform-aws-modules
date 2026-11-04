variable "name" {
  description = "Name of the service network"
  type        = string
}
variable "auth_type" {
  description = "Authorization type: NONE or AWS_IAM"
  type        = string
  default     = "NONE"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to use for the association"
  type        = list(string)
}