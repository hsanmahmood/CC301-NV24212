variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "env" {
  type    = string
  default = "dev"
}

variable "student_id" {
  description = "Set this in terraform.tfvars"
  type        = string
}
