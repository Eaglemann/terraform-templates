<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_kms"></a> [kms](#module\_kms)

Source: terraform-aws-modules/kms/aws

Version: ~> 2.1

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

### <a name="input_enable_kms_key"></a> [enable\_kms\_key](#input\_enable\_kms\_key)

Description: Whether to create a KMS key for the project

Type: `bool`

Default: `true`

### <a name="input_key_deletion_window_in_days"></a> [key\_deletion\_window\_in\_days](#input\_key\_deletion\_window\_in\_days)

Description: The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key

Type: `number`

Default: `7`

## Outputs

The following outputs are exported:

### <a name="output_kms_key_arn"></a> [kms\_key\_arn](#output\_kms\_key\_arn)

Description: The ARN of the KMS key

### <a name="output_kms_key_id"></a> [kms\_key\_id](#output\_kms\_key\_id)

Description: The ID of the KMS key
<!-- END_TF_DOCS -->