# tests/networking.tftest.hcl

variables {
  project_name       = "test"
  environment        = "ci"
  vpc_cidr           = "10.10.0.0/16"
  availability_zones = ["eu-central-1a", "eu-central-1b"]
  private_subnets    = ["10.10.1.0/24", "10.10.2.0/24"]
  public_subnets     = ["10.10.101.0/24", "10.10.102.0/24"]
  enable_nat_gateway = true
  single_nat_gateway = true
}

run "valid_vpc_creation" {
  command = apply

  assert {
    condition     = module.vpc.vpc_id != ""
    error_message = "VPC ID should not be empty."
  }

  assert {
    condition     = length(module.vpc.private_subnets) == 2
    error_message = "Expected 2 private subnets."
  }

  assert {
    condition     = length(module.vpc.public_subnets) == 2
    error_message = "Expected 2 public subnets."
  }
}
