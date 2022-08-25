
variable "environment" {
  description = "Project environment"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "security_groups" {
  description = "Secutiry groups"
  type        = map
}

variable "key_pairs" {
  description = "Key pairs"
  type        = map
}
