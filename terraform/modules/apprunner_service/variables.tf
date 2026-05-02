variable "project_name" {
  description = "Project name used for App Runner service names."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "service_name" {
  description = "Short service name such as api or frontend."
  type        = string
  default     = "api"
}

variable "image_identifier" {
  description = "Container image identifier. Use a placeholder until the real ECR or public image exists."
  type        = string
}

variable "image_repository_type" {
  description = "Image repository type: ECR, ECR_PUBLIC, or other App Runner supported type."
  type        = string
  default     = "ECR_PUBLIC"
}

variable "port" {
  description = "Container port exposed by the service."
  type        = string
  default     = "8000"
}

variable "environment_variables" {
  description = "Non-secret runtime environment variables."
  type        = map(string)
  default     = {}
}

variable "environment_secrets" {
  description = "Secret environment variables mapped to Secrets Manager ARNs. Values must be ARNs, not secret plaintext."
  type        = map(string)
  default     = {}
}

variable "cpu" {
  description = "App Runner CPU size."
  type        = string
  default     = "0.25 vCPU"
}

variable "memory" {
  description = "App Runner memory size."
  type        = string
  default     = "0.5 GB"
}

variable "instance_role_arn" {
  description = "Optional IAM role ARN for the App Runner instance. Use TODO placeholder outside committed examples until known."
  type        = string
  default     = ""
}

variable "auto_deployments_enabled" {
  description = "Whether App Runner should auto deploy image updates."
  type        = bool
  default     = false
}

variable "health_check_path" {
  description = "HTTP health check path."
  type        = string
  default     = "/health"
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
