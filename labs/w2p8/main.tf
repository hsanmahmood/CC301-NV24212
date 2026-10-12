terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "env" {
  default = "dev"
}
variable "student_id" {
  default = "s1234"
}

locals {
  common_tags = {
    Unit        = "CC301"
    Environment = var.env
    Owner       = var.student_id
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket" "reports" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-reports"
  tags   = merge(local.common_tags, { Purpose = "reports" })
}

resource "aws_s3_bucket" "photos" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-photos"
  tags   = merge(local.common_tags, { Purpose = "photos" })
}

