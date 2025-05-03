terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.94.1"
    }
  }

  required_version = "~> 1.11.4"

  backend "s3" {
    bucket = "ap-ecs-tf-state"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
