variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "environment" {
  description = "The environment name (e.g., dev, prod)"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID"
  type        = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC for the Redis Subnet Group"
  type        = list(string)
}

variable "app_security_group_id" {
  description = "The ID of the application security group allowed to connect to Redis"
  type        = string
}

variable "node_type" {
  description = "The type of Redis node to use"
  type        = string
  default     = "cache.t3.micro"
}

variable "num_cache_nodes" {
  description = "The number of cache nodes in the cluster"
  type        = number
  default     = 1
}

variable "kms_key_arn" {
  description = "The ARN for the KMS key to encrypt the cache at rest"
  type        = string
  default     = ""
}
