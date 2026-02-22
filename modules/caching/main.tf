terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

module "redis_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-${var.project_name}-redis-sg"
  description = "Security group for Redis"
  vpc_id      = var.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      from_port                = 6379
      to_port                  = 6379
      protocol                 = "tcp"
      description              = "Redis access from application"
      source_security_group_id = var.app_security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
  egress_rules                                             = ["all-all"]
}

resource "aws_elasticache_subnet_group" "redis" {
  name       = "${var.environment}-${var.project_name}-redis-subnet"
  subnet_ids = var.private_subnets
}

# Production Redis via Replication Group (Supports Encryption)
resource "aws_elasticache_replication_group" "redis" {
  replication_group_id = "${var.environment}-${var.project_name}-redis"
  description          = "Redis cluster for ${var.environment}"
  node_type            = var.node_type
  num_cache_clusters   = var.num_cache_nodes
  parameter_group_name = "default.redis7"
  engine_version       = "7.0"
  port                 = 6379

  subnet_group_name  = aws_elasticache_subnet_group.redis.name
  security_group_ids = [module.redis_sg.security_group_id]

  at_rest_encryption_enabled = var.kms_key_arn != "" ? true : false
  kms_key_id                 = var.kms_key_arn != "" ? var.kms_key_arn : null
  transit_encryption_enabled = true

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}
