terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "server" {
  filename = "${path.module}/web-server.txt"
  content  = "role=api\n"
}
