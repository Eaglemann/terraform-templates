variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-east-1"
}
