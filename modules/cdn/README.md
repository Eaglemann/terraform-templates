<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_cdn"></a> [cdn](#module\_cdn)

Source: terraform-aws-modules/cloudfront/aws

Version: ~> 3.0

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name (e.g., dev, prod)

Type: `string`

### <a name="input_origin_domain_name"></a> [origin\_domain\_name](#input\_origin\_domain\_name)

Description: The DNS name of the origin (e.g. S3 bucket domain or ALB DNS name)

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_acm_certificate_arn"></a> [acm\_certificate\_arn](#input\_acm\_certificate\_arn)

Description: ARN of the ACM certificate to use if domain\_name is specified (must be in us-east-1)

Type: `string`

Default: `""`

### <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name)

Description: The custom domain name for the CloudFront distribution (e.g. static.example.com)

Type: `string`

Default: `""`

### <a name="input_origin_id"></a> [origin\_id](#input\_origin\_id)

Description: A unique identifier for the origin

Type: `string`

Default: `"primary-origin"`

## Outputs

The following outputs are exported:

### <a name="output_cloudfront_distribution_domain_name"></a> [cloudfront\_distribution\_domain\_name](#output\_cloudfront\_distribution\_domain\_name)

Description: The domain name corresponding to the distribution

### <a name="output_cloudfront_distribution_id"></a> [cloudfront\_distribution\_id](#output\_cloudfront\_distribution\_id)

Description: The ID of the CloudFront distribution
<!-- END_TF_DOCS -->