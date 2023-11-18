resource "azurerm_subnet" "subnets" {
  count = length(var.subnets)
  name                 = format("snet-%s-%s-%s",var.environment,var.location,count.index)
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnets[count.index].address_prefixes
}