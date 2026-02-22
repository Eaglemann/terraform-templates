<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (~> 5.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_compute"></a> [compute](#module\_compute)

Source: ../../modules/compute

Version:

### <a name="module_database"></a> [database](#module\_database)

Source: ../../modules/database

Version:

### <a name="module_networking"></a> [networking](#module\_networking)

Source: ../../modules/networking

Version:

### <a name="module_security"></a> [security](#module\_security)

Source: ../../modules/security

Version:

### <a name="module_storage"></a> [storage](#module\_storage)

Source: ../../modules/storage

Version:

## Resources

No resources.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region)

Description: AWS region

Type: `string`

Default: `"us-east-1"`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: Environment name

Type: `string`

Default: `"dev"`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: Project name

Type: `string`

Default: `"myapp"`

## Outputs

The following outputs are exported:

### <a name="output_application_endpoint"></a> [application\_endpoint](#output\_application\_endpoint)

Description: ALB Endpoint

### <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)

Description: VPC ID
<!-- END_TF_DOCS -->