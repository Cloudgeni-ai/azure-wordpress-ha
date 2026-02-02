output "vm_id" {
  description = "Virtual machine ID"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  description = "Virtual machine name"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "public_ip" {
  description = "Public IP address"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "private_ip" {
  description = "Private IP address"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}
