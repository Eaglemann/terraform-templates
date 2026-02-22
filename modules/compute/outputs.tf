output "alb_dns_name" {
  description = "The DNS name of the load balancer"
  value       = module.alb.lb_dns_name
}

output "alb_arn" {
  description = "The ARN of the load balancer"
  value       = module.alb.lb_arn
}

output "asg_name" {
  description = "The Auto Scaling Group name"
  value       = module.asg.autoscaling_group_name
}

output "security_group_alb_id" {
  description = "The security group ID of the ALB"
  value       = module.alb_sg.security_group_id
}

output "security_group_asg_id" {
  description = "The security group ID of the ASG"
  value       = module.asg_sg.security_group_id
}
