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

### <a name="module_redis_sg"></a> [redis\_sg](#module\_redis\_sg)

Source: terraform-aws-modules/security-group/aws

Version: ~> 5.0

## Resources

The following resources are used by this module:

- [aws_elasticache_replication_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_replication_group) (resource)
- [aws_elasticache_subnet_group.redis](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) (resource)

## Required Inputs

The following input variables are required:

### <a name="input_app_security_group_id"></a> [app\_security\_group\_id](#input\_app\_security\_group\_id)

Description: The ID of the application security group allowed to connect to Redis

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name (e.g., dev, prod)

Type: `string`

### <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets)

Description: A list of private subnets inside the VPC for the Redis Subnet Group

Type: `list(string)`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

### <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)

Description: The VPC ID

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn)

Description: The ARN for the KMS key to encrypt the cache at rest

Type: `string`

Default: `""`

### <a name="input_node_type"></a> [node\_type](#input\_node\_type)

Description: The type of Redis node to use

Type: `string`

Default: `"cache.t3.micro"`

### <a name="input_num_cache_nodes"></a> [num\_cache\_nodes](#input\_num\_cache\_nodes)

Description: The number of cache nodes in the cluster

Type: `number`

Default: `1`

## Outputs

The following outputs are exported:

### <a name="output_redis_endpoint"></a> [redis\_endpoint](#output\_redis\_endpoint)

Description: The DNS name of the Redis cluster

### <a name="output_redis_port"></a> [redis\_port](#output\_redis\_port)

Description: The port used to connect to the Redis cluster
<!-- END_TF_DOCS -->