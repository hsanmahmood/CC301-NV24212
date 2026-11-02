resource "aws_s3_bucket" "this" {
  bucket = "cc301-${var.env}-${lower(var.student_id)}-${var.purpose}"

  tags = {
    Unit        = "CC301"
    Environment = var.env
    Owner       = var.student_id
    ManagedBy   = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = var.versioning ? "Enabled" : "Suspended"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  count  = var.purpose == "photos" ? 1 : 0
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
