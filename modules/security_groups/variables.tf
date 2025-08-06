variable "vpc_id" {
  description = "VPC ID where security groups will be created"
  type        = string
}

variable "alb_ingress_cidrs" {
  description = "List of CIDRs allowed to access ALB HTTP port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_port" {
  description = "Port ALB listens on"
  type        = number
  default     = 80
}

variable "ecs_port" {
  description = "Port ECS containers listen on"
  type        = number
  default     = 80
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

