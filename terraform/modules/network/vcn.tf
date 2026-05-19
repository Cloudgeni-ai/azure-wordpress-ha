resource "oci_core_vcn" "vcn" {
  compartment_id = var.compartment_id
  cidr_blocks    = ["10.0.0.0/16"]
  display_name   = "vcn-${var.name}"
  dns_label      = "vcn${replace(var.name, "-", "")}"
  freeform_tags  = var.tags
}

resource "oci_core_internet_gateway" "igw" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "igw-${var.name}"
  enabled        = true
  freeform_tags  = var.tags
}

resource "oci_core_route_table" "rt" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn.id
  display_name   = "rt-${var.name}"

  route_rules {
    destination       = "0.0.0.0/0"
    network_entity_id = oci_core_internet_gateway.igw.id
  }

  freeform_tags = var.tags
}
