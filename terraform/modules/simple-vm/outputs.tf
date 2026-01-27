output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.simple_vm.id
}

output "vm_name" {
  description = "Name of the virtual machine"
  value       = azurerm_linux_virtual_machine.simple_vm.name
}

output "public_ip" {
  description = "Public IP address of the VM"
  value       = azurerm_public_ip.simple_vm.ip_address
}

output "private_ip" {
  description = "Private IP address of the VM"
  value       = azurerm_network_interface.simple_vm.private_ip_address
}
