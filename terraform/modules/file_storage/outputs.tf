output "file_system_id" {
  description = "File System OCID"
  value       = oci_file_storage_file_system.wordpress_content.id
}

output "mount_target_ip" {
  description = "Mount target private IP address"
  value       = oci_file_storage_mount_target.mount_target.private_ip_ids[0]
}

output "export_path" {
  description = "NFS export path"
  value       = oci_file_storage_export.export.path
}
