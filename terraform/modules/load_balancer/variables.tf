variable "compartment_id" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "name" {
  description = "Name suffix for resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet OCID for the load balancer"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
