terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "team" {
  filename = "${path.module}/team.txt"
  content  = "owner=s1234\n"
}
