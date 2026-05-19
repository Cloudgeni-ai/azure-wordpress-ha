output "file_system_id" {
  description = "File System OCID"
  value       = oci_file_storage_file_system.wordpress_content.id
}

output "mount_target_ip" {
  description = "Mount target private IP address"
  value       = data.oci_core_private_ip.mount_target_ip.ip_address
}

output "export_path" {
  description = "NFS export path"
  value       = oci_file_storage_export.export.path
}
