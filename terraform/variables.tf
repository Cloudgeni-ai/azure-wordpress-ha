variable "tenancy_ocid" {
  description = "OCI Tenancy OCID"
  type        = string
}

variable "user_ocid" {
  description = "OCI User OCID for API key authentication"
  type        = string
}

variable "api_fingerprint" {
  description = "Fingerprint of the OCI API signing key"
  type        = string
}

variable "api_private_key" {
  description = "PEM-encoded OCI API private key content"
  type        = string
  sensitive   = true
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
