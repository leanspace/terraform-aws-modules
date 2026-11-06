module "eks_cluster" {

  source  = "terraform-aws-modules/eks/aws"
  version = "20.35.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  cluster_enabled_log_types = var.eks_log_types

  cluster_endpoint_private_access      = var.eks_private_access
  cluster_endpoint_public_access       = true
  cluster_endpoint_public_access_cidrs = var.eks_public_access_cidrs

  # Deliberately false: this flag grants admin to whoever's *session* runs apply, recomputed
  # every time - not a fixed identity. With CI (github-deployment-role) and humans both
  # applying, it churns the access entry on every run that isn't the same caller as last time,
  # and would collide with a caller also listed in the consuming root's explicit admin-entries
  # (extra_admin_role_arns in terraform-aws-infra). Admin access is managed explicitly there
  # instead, via aws_eks_access_entry/aws_eks_access_policy_association resources.
  enable_cluster_creator_admin_permissions = false

  create_cluster_security_group = true

  cluster_ip_family = "ipv4"

  # Upstream reads each addon's version from an object (addon_version); a plain string is
  # silently ignored and the addon follows AWS's latest default build instead.
  cluster_addons = {
    kube-proxy             = { addon_version = var.kube_proxy_addon_version }
    vpc-cni                = { addon_version = var.vpc_cni_addon_version }
    eks-pod-identity-agent = { addon_version = var.eks_pod_identity_agent_addon_version }
  }

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnets

  node_security_group_tags = var.node_security_group_tags

  tags = var.tags
}