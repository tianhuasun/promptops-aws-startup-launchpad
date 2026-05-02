output "service_arn" {
  description = "App Runner service ARN."
  value       = aws_apprunner_service.this.arn
}

output "service_url" {
  description = "App Runner generated service URL. This is known only after creation."
  value       = aws_apprunner_service.this.service_url
}

output "service_id" {
  description = "App Runner service ID."
  value       = aws_apprunner_service.this.service_id
}
