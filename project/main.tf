locals {
  buckets = {
    reports = true
    photos  = false
    archive = false
  }
}

module "bucket" {
  source     = "./modules/tagged_bucket"
  for_each   = local.buckets
  purpose    = each.key
  env        = var.env
  student_id = var.student_id
  versioning = each.value
}
