variable "environment" {
  description = "The environment name"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "bucket_name_suffix" {
  description = "The suffix for the S3 bucket name"
  type        = string
  default     = "assets"
}

variable "versioning_enabled" {
  description = "Whether to enable versioning for the S3 bucket"
  type        = bool
  default     = true
}

variable "force_destroy" {
  description = "A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error"
  type        = bool
  default     = false
}
