output "key_id" {
  description = "The globally unique identifier for the KMS key."
  value       = module.kms.key_id
}

output "key_arn" {
  description = "The Amazon Resource Name (ARN) of the KMS key."
  value       = module.kms.key_arn
}

output "key_aliases" {
  description = "List of aliases created for the KMS key."
  value       = module.kms.aliases
}
