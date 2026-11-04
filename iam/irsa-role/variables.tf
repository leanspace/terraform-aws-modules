variable "role_name" {
  description = "Name of the IAM role assumed via IRSA"
  type        = string
}

variable "policy_name" {
  description = "Name of the IAM policy attached to the role"
  type        = string
}

variable "policy_json" {
  description = "Full JSON policy document granting the permissions this role needs"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the EKS cluster's IAM OIDC identity provider (aws_iam_openid_connect_provider)"
  type        = string
}

variable "oidc_provider_url" {
  description = "Issuer URL of the EKS cluster's OIDC provider (e.g. data.aws_eks_cluster.this.identity[0].oidc[0].issuer), including the https:// prefix"
  type        = string
}

variable "service_account_subjects" {
  description = <<-EOT
    Kubernetes ServiceAccount subjects allowed to assume this role, in
    "system:serviceaccount:<namespace>:<name>" form. Multiple entries are OR'd
    together. Entries may be exact subjects or StringLike wildcard patterns
    (e.g. "system:serviceaccount:services:*") - prefer a namespace-scoped
    wildcard over listing every ServiceAccount individually, so onboarding a
    new consumer is a values-only change (annotate its ServiceAccount) with
    no Terraform/IAM update required.
  EOT
  type        = list(string)
}

variable "tags" {
  description = "Map of tags to apply to the IAM role"
  type        = map(string)
  default     = {}
}
