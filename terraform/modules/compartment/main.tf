resource "oci_identity_compartment" "compartment" {
  compartment_id = var.parent_compartment_id
  name           = var.name
  description    = var.description
  freeform_tags  = var.tags

  lifecycle {
    prevent_destroy = false
  }
}
