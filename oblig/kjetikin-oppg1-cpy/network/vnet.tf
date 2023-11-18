// Resource group
resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-%s-%s-%s", lower(var.project_name), var.environment, random_integer.random_instance.result)
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = var.common_tags
}


// A network interface for the vnet.
// Created if there is a vet for 
resource "azurerm_network_interface" "nics" {
  count = length(var.pip_ids)
  name                = lower(format("nic-%s-%s-%s", var.project_name, var.environment ,random_string.random_string.result))
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name

  ip_configuration {
    name                          = "ip-internal-config"
    subnet_id                     = azurerm_subnet.subnets[count.index].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.pip_ids[count.index]
  }

  // Tags
  tags = var.common_tags
}