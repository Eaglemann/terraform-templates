<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_s3_bucket"></a> [s3\_bucket](#module\_s3\_bucket)

Source: terraform-aws-modules/s3-bucket/aws

Version: ~> 4.0

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_bucket_name_suffix"></a> [bucket\_name\_suffix](#input\_bucket\_name\_suffix)

Description: The suffix for the S3 bucket name

Type: `string`

Default: `"assets"`

### <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy)

Description: A boolean that indicates all objects should be deleted from the bucket so that the bucket can be destroyed without error

Type: `bool`

Default: `false`

### <a name="input_versioning_enabled"></a> [versioning\_enabled](#input\_versioning\_enabled)

Description: Whether to enable versioning for the S3 bucket

Type: `bool`

Default: `true`

## Outputs

The following outputs are exported:

### <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn)

Description: The ARN of the bucket. Will be of format arn:aws:s3:::bucketname

### <a name="output_s3_bucket_bucket_domain_name"></a> [s3\_bucket\_bucket\_domain\_name](#output\_s3\_bucket\_bucket\_domain\_name)

Description: The bucket domain name. Will be of format bucketname.s3.amazonaws.com

### <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id)

Description: The name of the bucket

### <a name="output_s3_bucket_region"></a> [s3\_bucket\_region](#output\_s3\_bucket\_region)

Description: The AWS region this bucket resides in
<!-- END_TF_DOCS -->