output "instance_pool_id" {
  description = "Instance Pool OCID"
  value       = oci_core_instance_pool.pool.id
}

output "auto_scaling_config_id" {
  description = "Auto Scaling Configuration OCID"
  value       = oci_autoscaling_auto_scaling_configuration.asc.id
}
