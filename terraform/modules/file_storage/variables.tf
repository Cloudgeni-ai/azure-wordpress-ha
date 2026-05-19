variable "compartment_id" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "suffix" {
  description = "Resource name suffix"
  type        = string
}

variable "subnet_id" {
  description = "Subnet OCID for mount target"
  type        = string
}

variable "availability_domain" {
  description = "OCI Availability Domain"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
