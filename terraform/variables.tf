variable "tenancy_ocid" {
  description = "OCI Tenancy OCID"
  type        = string
}

variable "availability_domain" {
  description = "OCI Availability Domain name (e.g. ABcd:EU-FRANKFURT-1-AD-1)"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for compute instances"
  type        = string
}

variable "database_admin_password" {
  description = "PostgreSQL database admin password"
  type        = string
  sensitive   = true
}
