output "namespace" {
  description = "Object Storage namespace"
  value       = data.oci_objectstorage_namespace.ns.namespace
}

output "content_bucket_name" {
  description = "WordPress content bucket name"
  value       = oci_objectstorage_bucket.wordpress_content.name
}
