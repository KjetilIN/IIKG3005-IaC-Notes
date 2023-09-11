terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

# For creating random ID with 3 characters 
resource "random_string" "random_string" {
  length  = 3
  special = false
  upper   = false
}

# Resource group for the vnet with security group 
resource "azurerm_resource_group" "rg-vnet" {
  name     = format("%s-vnet-%s", var.base_name, random_string.random_string.result)
  location = var.location
}

# The Security group (NSG)
resource "azurerm_network_security_group" "nsg" {
  name                = format("%s-sg-%s", var.base_name, random_string.random_string.result)
  location            = azurerm_resource_group.rg-vnet.location
  resource_group_name = azurerm_resource_group.rg-vnet.name

  # Setup the security rule for allowing ssh to a set IP adress
  security_rule {
    name                       = "Allow_SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "31.45.84.112" # IP adress that can use this rule 
    destination_address_prefix = "*"
  }

  tags = var.common_tags


}

# The virtual network 
resource "azurerm_virtual_network" "vnet" {
  name                = format("%s-vnet-%s", var.base_name, random_string.random_string.result)
  location            = azurerm_resource_group.rg-vnet.location
  resource_group_name = azurerm_resource_group.rg-vnet.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = var.common_tags
}

# The subnet that we need for the vnet
resource "azurerm_subnet" "sn" {
  name                 = format("%s-sn-%s", var.base_name, random_string.random_string.result)
  resource_group_name  = azurerm_resource_group.rg-vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Associates a Network Security Group with a Subnet within a Virtual Network.
resource "azurerm_subnet_network_security_group_association" "snsga" {
  subnet_id                 = azurerm_subnet.sn.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# A network interface for the vnet
resource "azurerm_network_interface" "nic" {
  name                = format("%s-nic-vnetnic-%s", var.base_name, random_string.random_string.result)
  location            = azurerm_resource_group.rg-vnet.location
  resource_group_name = azurerm_resource_group.rg-vnet.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.sn.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.public_ip_address_id
  }
}