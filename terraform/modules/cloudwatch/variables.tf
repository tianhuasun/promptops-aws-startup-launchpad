variable "project_name" {
  description = "Project name used for CloudWatch resources."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "retention_days" {
  description = "CloudWatch log retention in days."
  type        = number
  default     = 14
}

variable "create_placeholder_alarm" {
  description = "Whether to create a placeholder metric alarm. Keep false until real resource dimensions are known."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
