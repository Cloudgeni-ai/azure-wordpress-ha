variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "vm_size" {
  description = "VM size"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "os_disk_type" {
  description = "OS disk storage account type"
  type        = string
  default     = "Standard_LRS"
}

variable "allow_ssh_from_ip" {
  description = "Source IP address or CIDR range allowed to SSH"
  type        = string
  default     = "*"
}

variable "allow_http" {
  description = "Allow HTTP traffic (port 80)"
  type        = bool
  default     = false
}

variable "allow_https" {
  description = "Allow HTTPS traffic (port 443)"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags"
  type        = map(string)
  default     = {}
}
