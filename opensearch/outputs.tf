output "name" {
  description = "Name of the OpenSearch cluster"
  value       = module.opensearch.domain_id
}

output "endpoint" {
  description = "Endpoint of the OpenSearch cluster"
  value       = module.opensearch.domain_endpoint
}

output "arn" {
  description = "ARN of the OpenSearch cluster"
  value       = module.opensearch.domain_arn
}