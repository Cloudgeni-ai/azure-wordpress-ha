resource "azurerm_subnet" "subnet" {
  name                 = "snt-${var.name}"
  resource_group_name  = var.resource_group
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  service_endpoints    = var.service_endpoints

}

resource "azurerm_subnet_network_security_group_association" "main" {
  count = length(azurerm_network_security_group.nsg) > 0 ? 1 : 0

  network_security_group_id = azurerm_network_security_group.nsg[0].id
  subnet_id                 = azurerm_subnet.subnet.id
}