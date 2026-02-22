# tests/storage.tftest.hcl

variables {
  project_name = "test"
  environment  = "ci"
  bucket_name  = "test-bucket-12345"
  versioning   = "Enabled"
}

run "valid_s3_bucket_creation" {
  command = apply

  assert {
    condition     = module.s3_bucket.s3_bucket_id != ""
    error_message = "Bucket ID should not be empty."
  }

  assert {
    condition     = module.s3_bucket.s3_bucket_arn != ""
    error_message = "Bucket ARN should not be empty."
  }
}
