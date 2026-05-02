variable "project_name" {
  description = "Project name used for secret names."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "secret_name" {
  description = "Logical secret name."
  type        = string
  default     = "app"
}

variable "description" {
  description = "Secret description."
  type        = string
  default     = "Application secret placeholder. Replace through a secure secret rotation process."
}

variable "placeholder_secret_json" {
  description = "Placeholder JSON values for demos only. Do not provide real secrets."
  type        = map(string)
  default     = {}
  sensitive   = true
}

variable "recovery_window_in_days" {
  description = "Recovery window before a deleted secret is permanently removed."
  type        = number
  default     = 7
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
