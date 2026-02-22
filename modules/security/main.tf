terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = "~> 2.1"

  create = var.enable_kms_key

  description             = "KMS key for ${var.project_name} ${var.environment}"
  deletion_window_in_days = var.key_deletion_window_in_days
  enable_key_rotation     = true

  aliases = ["${var.environment}/${var.project_name}/app"]

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
