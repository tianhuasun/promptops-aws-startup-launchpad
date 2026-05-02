variable "aws_region" {
  description = "AWS region for the MVP example."
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name used for AWS resource names."
  type        = string
  default     = "promptops-demo"
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "availability_zones" {
  description = "Availability zones used by the VPC example."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks."
  type        = list(string)
  default     = ["10.20.0.0/24", "10.20.1.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks."
  type        = list(string)
  default     = ["10.20.10.0/24", "10.20.11.0/24"]
}

variable "monthly_budget_usd" {
  description = "Monthly AWS budget guardrail."
  type        = number
  default     = 50
}

variable "budget_alert_email" {
  description = "Budget alert recipient. Replace placeholder before real deployment."
  type        = string
  default     = "replace-me@example.com"
}

variable "log_retention_days" {
  description = "CloudWatch log retention period."
  type        = number
  default     = 14
}

variable "static_assets_bucket_name" {
  description = "Placeholder S3 bucket name. Must be globally unique before real deployment."
  type        = string
  default     = "promptops-demo-static-assets-placeholder"
}

variable "database_name" {
  description = "Initial PostgreSQL database name."
  type        = string
  default     = "appdb"
}

variable "database_username" {
  description = "PostgreSQL admin username. Password is managed by RDS/Secrets Manager."
  type        = string
  default     = "app_admin"
}

variable "rds_instance_class" {
  description = "Small RDS instance class for MVP review."
  type        = string
  default     = "db.t4g.micro"
}

variable "backup_retention_days" {
  description = "RDS automated backup retention in days."
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Whether RDS deletion protection is enabled."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip a final RDS snapshot on deletion. Keep false outside disposable demos."
  type        = bool
  default     = false
}

variable "api_image_identifier" {
  description = "Placeholder App Runner image identifier. Replace with a real reviewed ECR image before deployment."
  type        = string
  default     = "public.ecr.aws/TODO_REPLACE_WITH_PUBLIC_ECR_ALIAS/promptops-api:latest"
}
