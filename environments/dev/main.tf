locals {
  tags = {
    Environment = "dev"
    Project     = "ecs-project"
  }
}

module "vpc" {
  source = "../../modules/vpc"

  name               = var.vpc_name
  cidr               = var.vpc_cidr
  azs                = var.azs
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  enable_nat_gateway = true
  single_nat_gateway = true

  tags = local.tags
}

module "ecr" {
  source = "../../modules/ecr"

  repository_name                   = var.repository_name
  repository_read_write_access_arns = var.repository_read_write_access_arns
  tags                              = local.tags
}

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id            = module.vpc.vpc_id
  alb_ingress_cidrs = ["0.0.0.0/0"]
  alb_port          = 80
  ecs_port          = 80
  tags              = local.tags
}

# module "alb" {
#   source = "../../modules/alb"

#   name            = var.alb_name
#   vpc_id          = module.vpc.vpc_id
#   subnet_ids      = module.vpc.public_subnets
#   security_groups = module.security_groups.alb_sg_id
#   tags            = local.tags
# }

# module "ecs_cluster" {
#   source = "../../modules/ecs"

#   cluster_name      = var.ecs_cluster_name
#   name_prefix       = var.ecs_cluster_prefix
#   image             = "${module.ecr.repository_url}:latest"
#   cpu               = "256"
#   memory            = "512"
#   desired_count     = 1
#   region            = var.region
#   private_subnets   = module.vpc.private_subnets
#   security_group_id = module.security_groups.ecs_sg_id
#   target_group_arn  = module.alb.target_group_arn
#   tags              = local.tags
# }
