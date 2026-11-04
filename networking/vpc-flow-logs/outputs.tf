output "s3_bucket_arn" {
  description = "The type of the destination for VPC Flow Logs"
  value       = module.s3_bucket.s3_bucket_arn
}