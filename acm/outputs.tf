output "certificate_arn" {
  description = "ARN of the certificate"
  value       = aws_acm_certificate.this.arn
}

output "domain_name" {
  description = "Domain name for which the certificate is issued"
  value       = aws_acm_certificate.this.domain_name
}

output "validation_domains" {
  description = "List of distinct domain validation options"
  value       = distinct([for dvo in aws_acm_certificate.this.domain_validation_options : dvo.domain_name])
}
