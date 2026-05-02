output "app_log_group_name" {
  description = "Application CloudWatch log group name."
  value       = aws_cloudwatch_log_group.app.name
}

output "database_log_group_name" {
  description = "Database CloudWatch log group name."
  value       = aws_cloudwatch_log_group.database.name
}
