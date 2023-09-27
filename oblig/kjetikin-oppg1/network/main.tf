terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }
}

# TODO: Fix naming convension with stage in name and instance 
# TODO: Add basename (?)

# For creating random ID with 3 characters 
resource "random_string" "random_string" {
  length  = 3
  special = false
  upper   = false
}

# Resource group for the network module
resource "azurerm_resource_group" "rg_network" {
  name     = var.rg_name
  location = var.rg_location

  #Tags
  tags = var.common_tags
}

# Network Securtiy Group
resource "azurerm_network_security_group" "nsg" {
  name                = format("nsg-",var.project_name,"-", random_string.random_string.result)
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name

  #Tags
  tags = var.common_tags
}

# VNET - Virtual Network 
resource "azurerm_virtual_network" "vnet" {
  name                = format("vnet-",var.project_name,"-", random_string.random_string.result)
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = format("snet-", var.project_name, "-", random_string.random_string.value)
    address_prefix = "10.0.1.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  subnet {
    name           = format("snet-", var.project_name, "-", random_string.random_string.value)
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.nsg.id
  }

  #Tags
  tags = var.common_tags
}


# A network interface for the vnet
resource "azurerm_network_interface" "nic" {
  name                = format("nic-", var.project_name, "-", random_string.random_string.result)
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name

  ip_configuration {
    name                          = "ip-internal-config"
    subnet_id                     = azurerm_virtual_network.vnet.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.public_ip_address_id
  }

  #Tags
  tags = var.common_tags
}