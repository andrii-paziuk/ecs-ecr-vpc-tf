variable "cluster_name" {
  type = string
}

variable "name_prefix" {
  type = string
}

variable "image" {
  type = string
}

variable "cpu" {
  type = string
  default = "256"
}

variable "memory" {
  type = string
  default = "512"
}

variable "region" {
  type = string
}

variable "desired_count" {
  type = number
  default = 1
}

variable "private_subnets" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "tags" {
  type = map(string)
  default = {}
}
