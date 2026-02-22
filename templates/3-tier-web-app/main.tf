# 3-Tier Web Application Template
# -------------------------------
# This template provides a complete boilerplate for a 3-tier web architecture.
# It includes:
# 1. Networking (VPC, Public/Private subnets)
# 2. Database (RDS PostgreSQL in private subnet)
# 3. Compute (ALB in public subnet, ASG in private subnet)
# 4. Security (KMS and Security Groups)

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Environment = var.environment
      Project     = var.project_name
      Template    = "3-tier-web-app"
    }
  }
}

variable "aws_region" {
  default = "us-east-1"
}

variable "environment" {
  default = "dev"
}

variable "project_name" {
  default = "myapp"
}

module "networking" {
  source = "../../modules/networking"

  environment  = var.environment
  project_name = var.project_name

  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnets    = ["10.0.1.0/24", "10.0.2.0/24"]
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "security" {
  source = "../../modules/security"

  environment    = var.environment
  project_name   = var.project_name
  enable_kms_key = true
}

module "compute" {
  source = "../../modules/compute"

  environment  = var.environment
  project_name = var.project_name

  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnets
  private_subnets = module.networking.private_subnets

  instance_type    = "t3.micro"
  min_size         = 2
  max_size         = 4
  desired_capacity = 2
}

module "database" {
  source = "../../modules/database"

  environment  = var.environment
  project_name = var.project_name

  vpc_id                = module.networking.vpc_id
  private_subnets       = module.networking.private_subnets
  app_security_group_id = module.compute.security_group_asg_id
}

output "application_url" {
  value = "http://${module.compute.alb_dns_name}"
}
