<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_vpc"></a> [vpc](#module\_vpc)

Source: terraform-aws-modules/vpc/aws

Version: ~> 5.0

## Resources

No resources.

## Required Inputs

The following input variables are required:

### <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones)

Description: A list of availability zones in the region

Type: `list(string)`

### <a name="input_environment"></a> [environment](#input\_environment)

Description: The environment name (e.g., dev, prod)

Type: `string`

### <a name="input_project_name"></a> [project\_name](#input\_project\_name)

Description: The name of the project

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_enable_nat_gateway"></a> [enable\_nat\_gateway](#input\_enable\_nat\_gateway)

Description: Should be true if you want to provision NAT Gateways for each of your private networks

Type: `bool`

Default: `true`

### <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets)

Description: A list of private subnets inside the VPC

Type: `list(string)`

Default:

```json
[
  "10.0.1.0/24",
  "10.0.2.0/24",
  "10.0.3.0/24"
]
```

### <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets)

Description: A list of public subnets inside the VPC

Type: `list(string)`

Default:

```json
[
  "10.0.101.0/24",
  "10.0.102.0/24",
  "10.0.103.0/24"
]
```

### <a name="input_single_nat_gateway"></a> [single\_nat\_gateway](#input\_single\_nat\_gateway)

Description: Should be true if you want to provision a single shared NAT Gateway across all of your private networks

Type: `bool`

Default: `false`

### <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr)

Description: The CIDR block for the VPC

Type: `string`

Default: `"10.0.0.0/16"`

## Outputs

The following outputs are exported:

### <a name="output_nat_ips"></a> [nat\_ips](#output\_nat\_ips)

Description: List of Elastic IPs created for AWS NAT Gateway

### <a name="output_private_route_table_ids"></a> [private\_route\_table\_ids](#output\_private\_route\_table\_ids)

Description: List of IDs of private route tables

### <a name="output_private_subnets"></a> [private\_subnets](#output\_private\_subnets)

Description: List of IDs of private subnets

### <a name="output_public_route_table_ids"></a> [public\_route\_table\_ids](#output\_public\_route\_table\_ids)

Description: List of IDs of public route tables

### <a name="output_public_subnets"></a> [public\_subnets](#output\_public\_subnets)

Description: List of IDs of public subnets

### <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id)

Description: The ID of the VPC
<!-- END_TF_DOCS -->