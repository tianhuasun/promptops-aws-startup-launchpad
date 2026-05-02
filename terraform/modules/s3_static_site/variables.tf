variable "bucket_name" {
  description = "Globally unique S3 bucket name for static assets. Use a placeholder in examples."
  type        = string
}

variable "cloudfront_distribution_arn" {
  description = "CloudFront distribution ARN allowed to read objects through OAC. Leave empty until distribution exists."
  type        = string
  default     = ""
}

variable "enable_versioning" {
  description = "Whether to enable S3 versioning for static assets."
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "Whether Terraform can delete a non-empty bucket. Keep false for production."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Common tags applied to resources."
  type        = map(string)
  default     = {}
}
