terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

module "db_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-${var.project_name}-db-sg"
  description = "Security group for database"
  vpc_id      = var.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "postgresql-tcp"
      source_security_group_id = var.app_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
  egress_rules                                             = ["all-all"]
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier = "${var.environment}-${var.project_name}-db"

  engine               = "postgres"
  engine_version       = "16"
  family               = "postgres16"
  major_engine_version = "16"
  instance_class       = var.db_instance_class

  allocated_storage = var.db_allocated_storage

  db_name  = var.db_name
  username = var.db_username
  port     = 5432

  multi_az               = var.environment == "prod" ? true : false
  db_subnet_group_name   = "${var.environment}-${var.project_name}-db-subnet-group"
  vpc_security_group_ids = [module.db_sg.security_group_id]

  storage_encrypted = true
  kms_key_id        = var.kms_key_arn

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  create_db_subnet_group = true
  subnet_ids             = var.private_subnets

  # Disable backups and performance insights for non-prod environments by default
  backup_retention_period = var.environment == "prod" ? 7 : 0
  skip_final_snapshot     = var.environment == "prod" ? false : true
  deletion_protection     = var.environment == "prod" ? true : false

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
