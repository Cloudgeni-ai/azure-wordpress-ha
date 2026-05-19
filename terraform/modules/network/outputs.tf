output "vcn_id" {
  description = "VCN OCID"
  value       = oci_core_vcn.vcn.id
}

output "subnet_id" {
  description = "Subnet OCID"
  value       = oci_core_subnet.subnet.id
}
