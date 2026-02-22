<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_archive"></a> [archive](#provider\_archive) (2.7.1)

- <a name="provider_aws"></a> [aws](#provider\_aws) (6.33.0)

## Modules

The following Modules are called:

### <a name="module_api_gateway"></a> [api\_gateway](#module\_api\_gateway)

Source: terraform-aws-modules/apigateway-v2/aws

Version: ~> 3.0

### <a name="module_lambda_function"></a> [lambda\_function](#module\_lambda\_function)

Source: terraform-aws-modules/lambda/aws

Version: ~> 6.0

## Resources

The following resources are used by this module:

- [aws_lambda_permission.apigw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) (resource)
- [archive_file.dummy](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name (e.g., dev, prod)

Type: `string`

### <a name="input_function_name"></a> [function\_name](#input\_function\_name)

Description: The name of the Lambda function

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_handler"></a> [handler](#input\_handler)

Description: The handler for the Lambda function

Type: `string`

Default: `"index.handler"`

### <a name="input_runtime"></a> [runtime](#input\_runtime)

Description: The runtime for the Lambda function

Type: `string`

Default: `"nodejs18.x"`

## Outputs

The following outputs are exported:

### <a name="output_apigw_http_endpoint"></a> [apigw\_http\_endpoint](#output\_apigw\_http\_endpoint)

Description: The HTTP endpoint for the API Gateway

### <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn)

Description: The ARN of the Lambda function

### <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name)

Description: The name of the Lambda function
<!-- END_TF_DOCS -->