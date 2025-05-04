module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway = var.single_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = var.tags
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "2.4.0"

  repository_name                   = var.ecr_name
  repository_read_write_access_arns = var.ecr_rw_arns
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = var.tags
}

# module "ecr_role" {
#   source = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"

#   trusted_role_arns = var.trusted_role_arns

#   create_role = true

#   role_name         = "ECRRole"
#   role_requires_mfa = true

#   custom_role_policy_arns = [
#     "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryPowerUser"
#   ]
#   number_of_custom_role_policy_arns = 1
# }
