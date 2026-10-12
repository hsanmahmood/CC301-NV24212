terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "report" {
  filename = "${path.module}/report.txt"
  content  = "status=ok\n"
}

output "report_file" {
  description = "Path of the report file"
  value       = local_file.report.filename
}

output "report_id" {
  description = "Identifier Terraform gave the file"
  value       = local_file.report.id
}
