variable "project_name" {
  description = "Project name used for the budget name."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "monthly_budget_usd" {
  description = "Monthly AWS budget amount in USD."
  type        = number
  default     = 50
}

variable "alert_email" {
  description = "Budget alert recipient email. Use a placeholder in examples and replace before real deployment."
  type        = string
  default     = "replace-me@example.com"
}
