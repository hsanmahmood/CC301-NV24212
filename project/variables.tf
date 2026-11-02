variable "env" {
  type        = string
  description = "Environment: dev or prod"

  validation {
    condition     = contains(["dev", "prod"], var.env)
    error_message = "env must be dev or prod."
  }
}

variable "student_id" {
  type        = string
  description = "Student ID used to keep bucket names unique."
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}
