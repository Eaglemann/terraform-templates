output "vpc_id" {
  description = "VPC ID"
  value       = module.networking.vpc_id
}

output "application_endpoint" {
  description = "ALB Endpoint"
  value       = module.compute.alb_dns_name
}
