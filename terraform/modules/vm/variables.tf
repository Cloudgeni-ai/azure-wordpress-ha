variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the VM"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for authentication"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to attach the VM to"
  type        = string
}

variable "enable_public_ip" {
  description = "Enable public IP address for the VM"
  type        = bool
  default     = false
}

variable "os_disk_type" {
  description = "Type of OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "os_disk_size_gb" {
  description = "Size of OS disk in GB"
  type        = number
  default     = 30
}

variable "image_publisher" {
  description = "OS image publisher"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "OS image offer"
  type        = string
  default     = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  description = "OS image SKU"
  type        = string
  default     = "22_04-lts-gen2"
}

variable "image_version" {
  description = "OS image version"
  type        = string
  default     = "latest"
}

variable "custom_data" {
  description = "Custom data script to run on VM startup"
  type        = string
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
