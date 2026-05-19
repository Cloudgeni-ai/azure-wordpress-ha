data "oci_objectstorage_namespace" "ns" {
  compartment_id = var.compartment_id
}

resource "oci_objectstorage_bucket" "wordpress_content" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "wordpress-content-${var.suffix}"
  access_type    = "NoPublicAccess"
  freeform_tags  = var.tags
}

resource "oci_objectstorage_bucket" "wordpress_backup_weekly" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "wordpress-content-bkp-weekly-${var.suffix}"
  access_type    = "NoPublicAccess"
  freeform_tags  = var.tags
}

resource "oci_objectstorage_bucket" "wordpress_backup_monthly" {
  compartment_id = var.compartment_id
  namespace      = data.oci_objectstorage_namespace.ns.namespace
  name           = "wordpress-content-bkp-monthly-${var.suffix}"
  access_type    = "NoPublicAccess"
  freeform_tags  = var.tags
}
