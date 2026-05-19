resource "oci_psql_db_system" "postgresql" {
  compartment_id = var.compartment_id
  display_name   = "postgresql-${var.suffix}"
  db_version     = "14"
  shape          = "PostgreSQL.VM.Standard.E4.Flex.2.32GB"

  storage_details {
    is_regionally_durable = false
    availability_domain   = var.availability_domain
    system_type           = "OCI_OPTIMIZED_STORAGE"
  }

  network_details {
    subnet_id = var.subnet_id
  }

  credentials {
    username = var.db_admin_username

    password_details {
      password_type = "PLAIN_TEXT"
      password      = var.db_admin_password
    }
  }

  instance_count              = 1
  instance_memory_size_in_gbs = 32
  instance_ocpu_count         = 2

  freeform_tags = var.tags
}
