variable "day" {
  type = string
}

resource "local_file" "this" {
  filename = "${path.root}/${var.day}.txt"
  content  = "note for ${var.day}\n"
}

output "path" {
  value = local_file.this.filename
}
