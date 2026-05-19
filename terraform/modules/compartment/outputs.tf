output "compartment_id" {
  description = "The OCID of the created compartment"
  value       = oci_identity_compartment.compartment.id
}
