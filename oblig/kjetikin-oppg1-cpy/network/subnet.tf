// The Subnets for the VNET
resource "azurerm_subnet" "subnets" {
  count = length(var.subnets)
  name                 = format("snet-%s-%s-%s",var.environment,var.location,count.index)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnets[count.index].address_prefixes
}

// Assosiate each subnet to the vnet
resource "azurerm_subnet_network_security_group_association" "ngs_snet_assoc" {
  count                    = length(var.subnets)
  subnet_id                = azurerm_subnet.subnets[count.index].id
  network_security_group_id = azurerm_network_security_group.nsg.id
}