variable "compartment_id" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "suffix" {
  description = "Resource name suffix"
  type        = string
}

variable "subnet_id" {
  description = "Subnet OCID for PostgreSQL"
  type        = string
}

variable "availability_domain" {
  description = "OCI Availability Domain"
  type        = string
}

variable "db_admin_username" {
  description = "Database admin username"
  type        = string
}

variable "db_admin_password" {
  description = "Database admin password"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
