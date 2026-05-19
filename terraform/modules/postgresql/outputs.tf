output "db_system_id" {
  description = "PostgreSQL DB System OCID"
  value       = oci_psql_db_system.postgresql.id
}

output "db_endpoint" {
  description = "PostgreSQL endpoint"
  value       = oci_psql_db_system.postgresql.endpoints[0].fqdn
}
