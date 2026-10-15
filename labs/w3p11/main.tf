# WEEK 3 STARTER - this works. That is the point.
# Your job is to refactor it into a module without changing what it builds.
#
# Before you start: read the three blocks carefully.
# One of them is missing something the other two have. Find it first.

resource "aws_s3_bucket" "reports" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-reports"

  tags = {
    Unit        = "CC301"
    Environment = var.env
    Owner       = var.student_id
    ManagedBy   = "Terraform"
    Purpose     = "reports"
  }
}

resource "aws_s3_bucket" "uploads" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-uploads"

  tags = {
    Unit        = "CC301"
    Environment = var.env
    Owner       = var.student_id
    ManagedBy   = "Terraform"
    Purpose     = "uploads"
  }
}

resource "aws_s3_bucket" "archive" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-archive"

  tags = {
    Unit        = "CC301"
    Environment = var.env
    Owner       = var.student_id
    ManagedBy   = "Terraform"
    Purpose     = "archive"
  }
}
