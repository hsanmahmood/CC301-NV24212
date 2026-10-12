terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

variable "env" {
  type    = string
  default = "dev"

  validation {
    condition     = contains(["dev", "test", "staging", "prod"], var.env)
    error_message = "env must be dev, test, staging or prod."
  }
}

resource "local_file" "env" {
  filename = "${path.module}/env.txt"
  content  = "environment=${var.env}\n"
}
