output "db_instance_arn" {
  description = "RDS instance ARN."
  value       = aws_db_instance.postgres.arn
}

output "db_instance_endpoint" {
  description = "RDS endpoint. This is not a secret but should be treated as environment-specific infrastructure metadata."
  value       = aws_db_instance.postgres.endpoint
}

output "db_subnet_group_name" {
  description = "RDS subnet group name."
  value       = aws_db_subnet_group.this.name
}

output "master_user_secret_arn" {
  description = "Secrets Manager ARN for RDS-managed master user secret when enabled."
  value       = try(aws_db_instance.postgres.master_user_secret[0].secret_arn, null)
  sensitive   = true
}
