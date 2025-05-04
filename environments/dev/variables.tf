variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_azs" {
  description = "The Availability Zones for the VPC"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway"
  type        = bool
}

variable "enable_vpn_gateway" {
  description = "Enable VPN Gateway"
  type        = bool
}

variable "single_nat_gateway" {
  description = "If true, deploy a single NAT Gateway"
  type        = bool
}

variable "tags" {
  description = "Tags to assign to the resources"
  type        = map(string)
  default     = {}
}

variable "ecr_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "ecr_rw_arns" {
  description = "List of ARNs with read/write access to the repository"
  type        = list(string)
}

# variable "trusted_role_arns" {
#   default = []
# }
