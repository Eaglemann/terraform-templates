variable "environment" {
  description = "The environment name"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC for the DB Subnet Group"
  type        = list(string)
}

variable "app_security_group_id" {
  description = "The ID of the security group belonging to the application that needs to access the database"
  type        = string
}

variable "db_instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "The database name"
  type        = string
  default     = "app"
}

variable "db_username" {
  description = "Username for the master DB user"
  type        = string
  default     = "administrator"
}

variable "kms_key_arn" {
  description = "The ARN for the KMS key to encrypt the database"
  type        = string
  default     = ""
}

