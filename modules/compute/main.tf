terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-${var.project_name}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = var.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
}

module "asg_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-${var.project_name}-asg-sg"
  description = "Security group for ASG instances"
  vpc_id      = var.vpc_id

  computed_ingress_with_source_security_group_id = [
    {
      rule                     = "http-80-tcp"
      source_security_group_id = module.alb_sg.security_group_id
    }
  ]
  number_of_computed_ingress_with_source_security_group_id = 1
  egress_rules                                             = ["all-all"]
}

module "log_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "~> 4.0"

  count = var.enable_alb_logging ? 1 : 0

  bucket = "${var.environment}-${var.project_name}-alb-logs"

  force_destroy                  = true
  attach_elb_log_delivery_policy = true
  attach_lb_log_delivery_policy  = true

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name    = "${var.environment}-${var.project_name}-alb"
  vpc_id  = var.vpc_id
  subnets = var.public_subnets

  security_groups = [module.alb_sg.security_group_id]

  access_logs = var.enable_alb_logging ? {
    bucket = module.log_bucket[0].s3_bucket_id
  } : {}

  target_groups = [
    {
      name_prefix      = "app-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]
}

module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.0"

  name = "${var.environment}-${var.project_name}-asg"

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  vpc_zone_identifier = var.private_subnets
  target_group_arns   = module.alb.target_group_arns
  security_groups     = [module.asg_sg.security_group_id]

  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  create_iam_instance_profile = true
  iam_role_name               = "${var.environment}-${var.project_name}-asg-role"
  iam_role_policies = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }

  scaling_policies = {
    avg_cpu_policy_greater_than_50 = {
      policy_type               = "TargetTrackingScaling"
      estimated_instance_warmup = 120
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 50.0
      }
    }
  }
}

resource "aws_wafv2_web_acl" "alb" {
  count = var.enable_waf ? 1 : 0

  name  = "${var.environment}-${var.project_name}-waf"
  scope = "REGIONAL"

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "${var.environment}-${var.project_name}-waf"
    sampled_requests_enabled   = true
  }

  rule {
    name     = "AWSManagedRulesCommonRuleSet"
    priority = 1

    override_action {
      none {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWSManagedRulesCommonRuleSetMetric"
      sampled_requests_enabled   = true
    }
  }
}

resource "aws_wafv2_web_acl_association" "alb" {
  count = var.enable_waf ? 1 : 0

  resource_arn = module.alb.lb_arn
  web_acl_arn  = aws_wafv2_web_acl.alb[0].arn
}
