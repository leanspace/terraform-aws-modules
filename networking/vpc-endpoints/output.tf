output "endpoints" {
  description = "Array containing the full resource object and attributes for all endpoints created"
  value       = module.vpc_endpoints.endpoints
}

output "security_group_arn" {
  description = "Amazon Resource Name (ARN) of the security group"
  value       = try(module.vpc_endpoints.security_group_arn, null)
}

output "security_group_id" {
  description = "ID of the security group"
  value       = try(module.vpc_endpoints.security_group_id, null)
}