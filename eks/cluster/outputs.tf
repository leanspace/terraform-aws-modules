output "cluster_primary_security_group_id" {
  value = module.eks_cluster.cluster_primary_security_group_id
}

output "node_security_group_id" {
  value = module.eks_cluster.node_security_group_id
}

output "cluster_service_cidr" {
  value = module.eks_cluster.cluster_service_cidr
}

output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "cluster_arn" {
  value = module.eks_cluster.cluster_arn
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks_cluster.cluster_certificate_authority_data
}