// Network Securtiy Group
resource "azurerm_network_security_group" "nsg" {
  name                = lower(format("nsg-%s-%s-%s",var.project_name,var.environment , random_integer.random_instance.result))
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  // Security rules for ssh to given ip adress
  security_rule {
    name = "Allow_SSH_VM"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefixes = var.public_ip_to_host
    destination_address_prefix = "*"
  }

  //Tags
  tags = var.common_tags
}