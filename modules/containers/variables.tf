variable "environment" {
  description = "The environment name"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "container_insights" {
  description = "Whether to use Container Insights"
  type        = bool
  default     = true
}

variable "capacity_providers" {
  description = "List of capacity providers to associate with the cluster"
  type        = list(string)
  default     = ["FARGATE", "FARGATE_SPOT"]
}

variable "default_capacity_provider_strategy" {
  description = "The capacity provider strategy to use by default"
  type = list(object({
    capacity_provider = string
    weight            = number
    base              = optional(number)
  }))
  default = [
    {
      capacity_provider = "FARGATE"
      weight            = 50
    },
    {
      capacity_provider = "FARGATE_SPOT"
      weight            = 50
    }
  ]
}
