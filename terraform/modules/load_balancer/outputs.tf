output "load_balancer_id" {
  description = "Load Balancer OCID"
  value       = oci_load_balancer_load_balancer.lb.id
}

output "load_balancer_ip" {
  description = "Load Balancer public IP address"
  value       = oci_load_balancer_load_balancer.lb.ip_address_details[0].ip_address
}

output "backend_set_name" {
  description = "Backend set name"
  value       = oci_load_balancer_backend_set.backend_set.name
}
