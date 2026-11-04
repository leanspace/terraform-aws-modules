output "db_subnet_group_name" {
  description = "The db subnet group name"
  value       = module.aurora.db_subnet_group_name
}

output "cluster_arn" {
  description = "Amazon Resource Name (ARN) of cluster"
  value       = module.aurora.cluster_arn
}

output "cluster_id" {
  description = "The RDS Cluster Identifier"
  value       = module.aurora.cluster_id
}

output "cluster_endpoint" {
  description = "Writer endpoint for the cluster"
  value       = module.aurora.cluster_endpoint
}

output "cluster_database_name" {
  description = "Name for an automatically created database on cluster creation"
  value       = module.aurora.cluster_database_name
}

output "cluster_port" {
  description = "The database port"
  value       = module.aurora.cluster_port
}
output "security_group_id" {
  description = "The database security group"
  value       = module.aurora.security_group_id
}

output "master_user_secret_arn" {
  description = "ARN of the Secrets Manager secret holding the current master user password (AWS-managed, auto-rotated - read its current value via aws_secretsmanager_secret_version, never copy it statically)"
  value       = module.aurora.cluster_master_user_secret[0].secret_arn
}
