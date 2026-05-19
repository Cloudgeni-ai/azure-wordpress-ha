variable "compartment_id" {
  description = "OCI Compartment OCID"
  type        = string
}

variable "name" {
  description = "Name suffix for resources"
  type        = string
}

variable "subnet_id" {
  description = "Subnet OCID for compute instances"
  type        = string
}

variable "availability_domain" {
  description = "OCI Availability Domain"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key for instance access"
  type        = string
}

variable "user_data" {
  description = "Base64-encoded cloud-init user data script"
  type        = string
}

variable "pool_size" {
  description = "Initial number of instances in the pool"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum number of instances"
  type        = number
  default     = 3
}

variable "max_size" {
  description = "Maximum number of instances"
  type        = number
  default     = 4
}

variable "shape" {
  description = "OCI compute shape"
  type        = string
  default     = "VM.Standard.E4.Flex"
}

variable "ocpus" {
  description = "Number of OCPUs per instance"
  type        = number
  default     = 2
}

variable "memory_in_gbs" {
  description = "Memory in GBs per instance"
  type        = number
  default     = 16
}

variable "load_balancer_id" {
  description = "Load Balancer OCID to attach instance pool"
  type        = string
}

variable "backend_set_name" {
  description = "Load Balancer backend set name"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}
