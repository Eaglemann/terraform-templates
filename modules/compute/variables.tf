variable "environment" {
  description = "The environment name"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be deployed"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnets for the ALB"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnets for the ASG"
  type        = list(string)
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "The minimum size of the ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "The maximum size of the ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "The desired capacity of the ASG"
  type        = number
  default     = 1
}

variable "enable_waf" {
  description = "Whether to create and attach a WAF WebACL to the ALB"
  type        = bool
  default     = true
}

variable "enable_alb_logging" {
  description = "Whether to enable access logs for the ALB (creates an S3 bucket)"
  type        = bool
  default     = true
}

