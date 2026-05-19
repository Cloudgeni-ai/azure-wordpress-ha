resource "oci_core_subnet" "subnet" {
  compartment_id    = var.compartment_id
  vcn_id            = oci_core_vcn.vcn.id
  cidr_block        = "10.0.1.0/24"
  display_name      = "snt-${var.name}"
  dns_label         = "subnet"
  route_table_id    = oci_core_route_table.rt.id
  security_list_ids = [oci_core_security_list.sl.id]
  freeform_tags     = var.tags
}
