variable "environment" {
  description = "The environment name"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "enable_kms_key" {
  description = "Whether to create a KMS key for the project"
  type        = bool
  default     = true
}

variable "key_deletion_window_in_days" {
  description = "The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key"
  type        = number
  default     = 7
}
