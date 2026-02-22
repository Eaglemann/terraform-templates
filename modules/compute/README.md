<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

The following providers are used by this module:

- <a name="provider_aws"></a> [aws](#provider\_aws) (6.33.0)

## Modules

The following Modules are called:

### <a name="module_alb"></a> [alb](#module\_alb)

Source: terraform-aws-modules/alb/aws

Version: ~> 8.0

### <a name="module_alb_sg"></a> [alb\_sg](#module\_alb\_sg)

Source: terraform-aws-modules/security-group/aws

Version: ~> 5.0

### <a name="module_asg"></a> [asg](#module\_asg)

Source: terraform-aws-modules/autoscaling/aws

Version: ~> 6.0

### <a name="module_asg_sg"></a> [asg\_sg](#module\_asg\_sg)

Source: terraform-aws-modules/security-group/aws

Version: ~> 5.0

### <a name="module_log_bucket"></a> [log\_bucket](#module\_log\_bucket)

Source: terraform-aws-modules/s3-bucket/aws

Version: ~> 4.0

## Resources

The following resources are used by this module:

- [aws_wafv2_web_acl.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl) (resource)
- [aws_wafv2_web_acl_association.alb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/wafv2_web_acl_association) (resource)
- [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name

Type: `string`

### <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets)

Description: A list of private subnets for the ASG

Type: `list(string)`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

### <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets)

Description: A list of public subnets for the ALB

Type: `list(string)`

### <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)

Description: The ID of the VPC where resources will be deployed

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_desired_capacity"></a> [desired\_capacity](#input\_desired\_capacity)

Description: The desired capacity of the ASG

Type: `number`

Default: `1`

### <a name="input_enable_alb_logging"></a> [enable\_alb\_logging](#input\_enable\_alb\_logging)

Description: Whether to enable access logs for the ALB (creates an S3 bucket)

Type: `bool`

Default: `true`

### <a name="input_enable_waf"></a> [enable\_waf](#input\_enable\_waf)

Description: Whether to create and attach a WAF WebACL to the ALB

Type: `bool`

Default: `true`

### <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type)

Description: The type of EC2 instance to launch

Type: `string`

Default: `"t3.micro"`

### <a name="input_max_size"></a> [max\_size](#input\_max\_size)

Description: The maximum size of the ASG

Type: `number`

Default: `3`

### <a name="input_min_size"></a> [min\_size](#input\_min\_size)

Description: The minimum size of the ASG

Type: `number`

Default: `1`

## Outputs

The following outputs are exported:

### <a name="output_alb_arn"></a> [alb\_arn](#output\_alb\_arn)

Description: The ARN of the load balancer

### <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name)

Description: The DNS name of the load balancer

### <a name="output_asg_name"></a> [asg\_name](#output\_asg\_name)

Description: The Auto Scaling Group name

### <a name="output_security_group_alb_id"></a> [security\_group\_alb\_id](#output\_security\_group\_alb\_id)

Description: The security group ID of the ALB

### <a name="output_security_group_asg_id"></a> [security\_group\_asg\_id](#output\_security\_group\_asg\_id)

Description: The security group ID of the ASG
<!-- END_TF_DOCS -->