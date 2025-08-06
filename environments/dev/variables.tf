variable "vpc_name" {
  default = "dev-vpc"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "repository_name" {
  default = "ecr-repo-dev"
}

variable "repository_read_write_access_arns" {
  default = [
    "arn:aws:iam::654654416545:user/andrii_admin",
  ]
}

variable "region" {
  default = "ap-southeast-1"
}

variable "alb_name" {
  default = "dev-ecs-alb"
}

variable "ecs_cluster_name" {
  default = "dev-cluster"
}

variable "ecs_cluster_prefix" {
  default = "dev"
}