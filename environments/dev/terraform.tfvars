vpc_name           = "dev-ecs-ecr"
vpc_cidr           = "10.10.0.0/16"
vpc_azs            = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
private_subnets    = ["10.10.1.0/24", "10.10.2.0/24", "10.10.3.0/24"]
public_subnets     = ["10.10.101.0/24", "10.10.102.0/24", "10.10.103.0/24"]
enable_nat_gateway = true
enable_vpn_gateway = false
single_nat_gateway = true
tags = {
  "Environment" = "dev"
  "Project"     = "ecs-ecr-tf-project"
}
ecr_name    = "dev-ecs-ecr-project"
ecr_rw_arns = []
