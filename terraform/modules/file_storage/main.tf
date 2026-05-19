resource "oci_file_storage_file_system" "wordpress_content" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  display_name        = "fs-wordpress-content-${var.suffix}"
  freeform_tags       = var.tags
}

resource "oci_file_storage_mount_target" "mount_target" {
  compartment_id      = var.compartment_id
  availability_domain = var.availability_domain
  subnet_id           = var.subnet_id
  display_name        = "mt-${var.suffix}"
  freeform_tags       = var.tags
}

resource "oci_file_storage_export_set" "export_set" {
  mount_target_id = oci_file_storage_mount_target.mount_target.id
  display_name    = "es-${var.suffix}"
}

resource "oci_file_storage_export" "export" {
  export_set_id  = oci_file_storage_export_set.export_set.id
  file_system_id = oci_file_storage_file_system.wordpress_content.id
  path           = "/wordpress-content"
}

data "oci_core_private_ip" "mount_target_ip" {
  private_ip_id = oci_file_storage_mount_target.mount_target.private_ip_ids[0]
}
