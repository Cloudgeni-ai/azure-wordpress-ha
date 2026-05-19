variable "parent_compartment_id" {
  description = "Parent compartment OCID (tenancy root or parent compartment)"
  type        = string
}

variable "name" {
  description = "Compartment name"
  type        = string
}

variable "description" {
  description = "Compartment description"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
