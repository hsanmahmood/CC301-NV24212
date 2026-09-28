terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "config" {
  filename = "${path.module}/config.txt"
  content  = "port=8080\n"
}