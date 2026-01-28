# Azure Virtual Machine Module

This module creates a simple Azure Linux virtual machine with associated networking components.

## Resources Created

- Azure Linux Virtual Machine
- Network Interface
- Public IP Address (optional)

## Usage

```hcl
module "vm" {
  source = "./modules/vm"

  vm_name             = "my-vm"
  resource_group_name = "my-rg"
  location            = "westus"
  vm_size             = "Standard_B2s"
  admin_username      = "azureuser"
  ssh_public_key      = "ssh-rsa AAAAB3..."
  subnet_id           = "subnet-id"
  enable_public_ip    = true

  tags = {
    Environment = "dev"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vm_name | Name of the virtual machine | string | n/a | yes |
| resource_group_name | Name of the resource group | string | n/a | yes |
| location | Azure region for the VM | string | n/a | yes |
| subnet_id | ID of the subnet to attach the VM to | string | n/a | yes |
| ssh_public_key | SSH public key for authentication | string | n/a | yes |
| vm_size | Size of the virtual machine | string | Standard_B2s | no |
| admin_username | Admin username for the VM | string | azureuser | no |
| enable_public_ip | Enable public IP address for the VM | bool | false | no |
| os_disk_type | Type of OS disk | string | Standard_LRS | no |
| os_disk_size_gb | Size of OS disk in GB | number | 30 | no |
| image_publisher | OS image publisher | string | Canonical | no |
| image_offer | OS image offer | string | 0001-com-ubuntu-server-jammy | no |
| image_sku | OS image SKU | string | 22_04-lts-gen2 | no |
| image_version | OS image version | string | latest | no |
| custom_data | Custom data script to run on VM startup | string | null | no |
| tags | Tags to apply to resources | map(string) | {} | no |

## Outputs

| Name | Description |
|------|-------------|
| vm_id | ID of the virtual machine |
| vm_name | Name of the virtual machine |
| private_ip | Private IP address of the VM |
| public_ip | Public IP address of the VM (if enabled) |
| nic_id | ID of the network interface |
