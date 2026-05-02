variable "project_name" {
  description = "Project name used for CloudFront naming."
  type        = string
}

variable "environment" {
  description = "Environment name such as dev, staging, or prod."
  type        = string
  default     = "dev"
}

variable "s3_bucket_regional_domain_name" {
  description = "Regional domain name of the private S3 origin."
  type        = string
}

variable "domain_aliases" {
  description = "Optional custom domain aliases. Leave empty for generated CloudFront domain."
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "Optional ACM certificate ARN for custom domains. Use a TODO placeholder outside committed examples until known."
  type        = string
  default     = ""
}

variable "default_root_object" {
  description = "Default object returned by CloudFront."
  type        = string
  default     = "index.html"
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
