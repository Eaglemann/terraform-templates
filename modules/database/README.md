<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_db"></a> [db](#module\_db)

Source: terraform-aws-modules/rds/aws

Version: ~> 6.0

### <a name="module_db_sg"></a> [db\_sg](#module\_db\_sg)

Source: terraform-aws-modules/security-group/aws

Version: ~> 5.0

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_app_security_group_id"></a> [app\_security\_group\_id](#input\_app\_security\_group\_id)

Description: The ID of the security group belonging to the application that needs to access the database

Type: `string`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name

Type: `string`

### <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets)

Description: A list of private subnets inside the VPC for the DB Subnet Group

Type: `list(string)`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

### <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id)

Description: The ID of the VPC

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage)

Description: The allocated storage in gigabytes

Type: `number`

Default: `20`

### <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class)

Description: The instance type of the RDS instance

Type: `string`

Default: `"db.t3.micro"`

### <a name="input_db_name"></a> [db\_name](#input\_db\_name)

Description: The database name

Type: `string`

Default: `"app"`

### <a name="input_db_username"></a> [db\_username](#input\_db\_username)

Description: Username for the master DB user

Type: `string`

Default: `"administrator"`

### <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn)

Description: The ARN for the KMS key to encrypt the database

Type: `string`

Default: `""`

## Outputs

The following outputs are exported:

### <a name="output_db_instance_address"></a> [db\_instance\_address](#output\_db\_instance\_address)

Description: The address of the RDS instance

### <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn)

Description: The ARN of the RDS instance

### <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint)

Description: The connection endpoint

### <a name="output_db_instance_name"></a> [db\_instance\_name](#output\_db\_instance\_name)

Description: The database name

### <a name="output_db_instance_port"></a> [db\_instance\_port](#output\_db\_instance\_port)

Description: The database port
<!-- END_TF_DOCS -->