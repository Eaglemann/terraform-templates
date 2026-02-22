variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "domain_name" {
  description = "The custom domain name for the CloudFront distribution (e.g. static.example.com)"
  type        = string
  default     = ""
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate to use if domain_name is specified (must be in us-east-1)"
  type        = string
  default     = ""
}

variable "origin_domain_name" {
  description = "The DNS name of the origin (e.g. S3 bucket domain or ALB DNS name)"
  type        = string
}

variable "origin_id" {
  description = "A unique identifier for the origin"
  type        = string
  default     = "primary-origin"
}
