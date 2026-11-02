terraform {
  backend "s3" {
    bucket         = "cc301-nv24212-tfstate"
    key            = "project/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "cc301-nv24212-locks"
    encrypt        = true
  }
}
