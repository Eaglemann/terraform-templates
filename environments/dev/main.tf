module "networking" {
  source = "../../modules/networking"

  environment  = var.environment
  project_name = var.project_name

  vpc_cidr           = "10.10.0.0/16"
  public_subnets     = ["10.10.101.0/24", "10.10.102.0/24"]
  private_subnets    = ["10.10.1.0/24", "10.10.2.0/24"]
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]

  enable_nat_gateway = true
  single_nat_gateway = true
}

module "security" {
  source = "../../modules/security"

  environment    = var.environment
  project_name   = var.project_name
  enable_kms_key = true
}

module "compute" {
  source = "../../modules/compute"

  environment  = var.environment
  project_name = var.project_name

  vpc_id          = module.networking.vpc_id
  public_subnets  = module.networking.public_subnets
  private_subnets = module.networking.private_subnets

  instance_type    = "t3.micro"
  min_size         = 1
  max_size         = 2
  desired_capacity = 1
}

module "database" {
  source = "../../modules/database"

  environment  = var.environment
  project_name = var.project_name

  vpc_id                = module.networking.vpc_id
  private_subnets       = module.networking.private_subnets
  app_security_group_id = module.compute.security_group_asg_id

  db_instance_class    = "db.t3.micro"
  db_allocated_storage = 20
}

module "storage" {
  source = "../../modules/storage"

  environment  = var.environment
  project_name = var.project_name

  bucket_name_suffix = "assets"
  versioning_enabled = true
}
