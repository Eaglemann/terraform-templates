terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

# The state bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket = "${var.environment}-${var.project_name}-terraform-state"

  tags = {
    Name        = "${var.environment}-${var.project_name}-terraform-state"
    Environment = var.environment
    Project     = var.project_name
  }
}

# Enable versioning on the state bucket
resource "aws_s3_bucket_versioning" "terraform_state_versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_state_encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Make sure all public access is blocked
resource "aws_s3_bucket_public_access_block" "terraform_state_access_block" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# The DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "${var.environment}-${var.project_name}-terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "${var.environment}-${var.project_name}-terraform-state-lock"
    Environment = var.environment
    Project     = var.project_name
  }
}
