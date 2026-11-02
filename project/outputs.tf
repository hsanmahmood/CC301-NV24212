output "bucket_names" {
  description = "Names of the project buckets."
  value       = { for purpose, bucket in module.bucket : purpose => bucket.name }
}
