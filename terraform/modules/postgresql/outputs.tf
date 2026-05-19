output "db_system_id" {
  description = "PostgreSQL DB System OCID"
  value       = oci_psql_db_system.postgresql.id
}

output "db_system_state" {
  description = "PostgreSQL DB System lifecycle state"
  value       = oci_psql_db_system.postgresql.state
}
