output "bucket_id" {
  description = "S3 bucket ID."
  value       = aws_s3_bucket.static_assets.id
}

output "bucket_arn" {
  description = "S3 bucket ARN."
  value       = aws_s3_bucket.static_assets.arn
}

output "bucket_regional_domain_name" {
  description = "S3 regional domain name for CloudFront origin."
  value       = aws_s3_bucket.static_assets.bucket_regional_domain_name
}
