terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "summary" {
  filename = "${path.module}/summary.txt"
  content  = "files: ${local_file.a.filename}, ${local_file.b.filename}\n"
}

resource "local_file" "a" {
  filename = "${path.module}/a.txt"
  content  = "a\n"
}

resource "local_file" "b" {
  filename = "${path.module}/b.txt"
  content  = "b\n"
}
