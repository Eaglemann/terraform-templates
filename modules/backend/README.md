<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (6.33.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [aws_dynamodb_table.terraform_state_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) (resource)
- [aws_s3_bucket.terraform_state](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) (resource)
- [aws_s3_bucket_public_access_block.terraform_state_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) (resource)
- [aws_s3_bucket_server_side_encryption_configuration.terraform_state_encryption](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) (resource)
- [aws_s3_bucket_versioning.terraform_state_versioning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name (e.g., dev, prod)

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)

Description: The AWS region

Type: `string`

Default: `"us-east-1"`

## Outputs

The following outputs are exported:

### <a name="output_backend_config"></a> [backend\_config](#output\_backend\_config)

Description: The backend configuration block to use in providers.tf

### <a name="output_dynamodb_table_name"></a> [dynamodb\_table\_name](#output\_dynamodb\_table\_name)

Description: The name of the DynamoDB table used for Terraform state locking

### <a name="output_s3_bucket_name"></a> [s3\_bucket\_name](#output\_s3\_bucket\_name)

Description: The name of the S3 bucket used for Terraform state storage
<!-- END_TF_DOCS -->