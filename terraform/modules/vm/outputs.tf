output "vm_id" {
  description = "Virtual machine ID"
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_private_ip" {
  description = "Private IP address"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}

output "vm_name" {
  description = "Virtual machine name"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "nsg_id" {
  description = "Network Security Group ID"
  value       = azurerm_network_security_group.vm_nsg.id
}

output "nsg_name" {
  description = "Network Security Group name"
  value       = azurerm_network_security_group.vm_nsg.name
}
