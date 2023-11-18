// Resource group
resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s-%s-%s", lower(var.project_name), var.environment, random_integer.random_instance.result)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = var.common_tags
}