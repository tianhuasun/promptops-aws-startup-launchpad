output "cloudfront_distribution_domain_name" {
  description = "Generated CloudFront domain name after creation. Do not invent this before apply."
  value       = module.cdn.domain_name
}

output "app_runner_service_url" {
  description = "Generated App Runner service URL after creation. Do not invent this before apply."
  value       = module.api_service.service_url
}

output "rds_endpoint" {
  description = "Private RDS endpoint after creation."
  value       = module.postgres.db_instance_endpoint
}

output "budget_name" {
  description = "AWS budget name."
  value       = module.budget.budget_name
}

output "app_secret_arn" {
  description = "Application secret ARN. The secret value is never output."
  value       = module.app_secret.secret_arn
}
