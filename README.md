# Terraform Infrastructure: ECS + ECR + VPC

This repository contains reusable infrastructure code to deploy an AWS ECS cluster with ECR and VPC using public Terraform modules.  
The goal is to make it simple to provision a complete ECS setup using standard `terraform` commands with minimal input.

## Structure

- Uses public Terraform modules for:
  - VPC
  - ECS Cluster
  - ECR Repository
- Supports multiple environments (`dev`, `prod`, etc.) via `terraform.tfvars` files.
- Terraform state is expected to be stored in an S3 backend (with DynamoDB locking, if needed).

## Usage

### To deploy

```bash
terraform init
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

### To destroy
```bash
terraform destroy -var-file="terraform.tfvars"
