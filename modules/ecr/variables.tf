variable "repository_name" {
  description = "Name of the ECR repository"
  type        = string
}

variable "repository_read_write_access_arns" {
  description = "List of IAM ARNs allowed read/write access to the repository"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the ECR repository"
  type        = map(string)
  default     = {}
}
