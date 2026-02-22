<!-- BEGIN_TF_DOCS -->
## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.0.0)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (>= 4.0.0)

## Providers

No providers.

## Modules

The following Modules are called:

### <a name="module_ecs"></a> [ecs](#module\_ecs)

Source: terraform-aws-modules/ecs/aws

Version: ~> 5.0

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

### <a name="input_capacity_providers"></a> [capacity\_providers](#input\_capacity\_providers)

Description: List of capacity providers to associate with the cluster

Type: `list(string)`

Default:

```json
[
  "FARGATE",
  "FARGATE_SPOT"
]
```

### <a name="input_container_insights"></a> [container\_insights](#input\_container\_insights)

Description: Whether to use Container Insights

Type: `bool`

Default: `true`

### <a name="input_default_capacity_provider_strategy"></a> [default\_capacity\_provider\_strategy](#input\_default\_capacity\_provider\_strategy)

Description: The capacity provider strategy to use by default

Type:

```hcl
list(object({
    capacity_provider = string
    weight            = number
    base              = optional(number)
  }))
```

Default:

```json
[
  {
    "capacity_provider": "FARGATE",
    "weight": 50
  },
  {
    "capacity_provider": "FARGATE_SPOT",
    "weight": 50
  }
]
```

## Outputs

The following outputs are exported:

### <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn)

Description: ARN of the ECS cluster

### <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id)

Description: ID of the ECS cluster

### <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name)

Description: Name of the ECS cluster
<!-- END_TF_DOCS -->