variable "project_name" {
  description = "Project name used for RDS naming."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs for the RDS subnet group."
  type        = list(string)
}

variable "database_security_group_ids" {
  description = "Security group IDs attached to RDS. These must not allow public database ingress."
  type        = list(string)
}

variable "database_name" {
  description = "Initial database name."
  type        = string
  default     = "appdb"
}

variable "master_username" {
  description = "Database master username. Do not use a personal name."
  type        = string
  default     = "app_admin"
}

variable "manage_master_user_password" {
  description = "Whether RDS manages the master password in Secrets Manager."
  type        = bool
  default     = true
}

variable "master_password" {
  description = "Optional master password only when manage_master_user_password is false. Never commit real values."
  type        = string
  default     = null
  sensitive   = true
}

variable "engine_version" {
  description = "PostgreSQL engine version."
  type        = string
  default     = "16.3"
}

variable "instance_class" {
  description = "RDS instance class. Keep small for MVP and review before production."
  type        = string
  default     = "db.t4g.micro"
}

variable "allocated_storage" {
  description = "Initial allocated storage in GB."
  type        = number
  default     = 20
}

variable "max_allocated_storage" {
  description = "Maximum autoscaled storage in GB."
  type        = number
  default     = 100
}

variable "backup_retention_days" {
  description = "Backup retention in days."
  type        = number
  default     = 7
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection."
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Whether to skip final snapshot on deletion. Use false for production."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
