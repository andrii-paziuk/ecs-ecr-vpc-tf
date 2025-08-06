terraform {
  backend "s3" {
    bucket = "ap-ecs-tf-state"
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-state-lock"
  }
}
