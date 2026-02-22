output "s3_bucket_name" {
  description = "The name of the S3 bucket used for Terraform state storage"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "dynamodb_table_name" {
  description = "The name of the DynamoDB table used for Terraform state locking"
  value       = aws_dynamodb_table.terraform_state_lock.name
}

output "backend_config" {
  description = "The backend configuration block to use in providers.tf"
  value       = <<EOF
backend "s3" {
  bucket         = "${aws_s3_bucket.terraform_state.bucket}"
  key            = "${var.environment}/terraform.tfstate"
  region         = "${var.aws_region}"
  encrypt        = true
  dynamodb_table = "${aws_dynamodb_table.terraform_state_lock.name}"
}
EOF
}
