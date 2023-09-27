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

  #Security rules for ssh to given ip adress
  security_rule {
    name = "Allow_SSH_VM"
    priority = 100
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "*"
    source_address_prefix = var.allowed_ip_address
    destination_address_prefix = "*"
  }

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

  #Tags
  tags = var.common_tags
}

# Subnet nr 1
resource "azurerm_subnet" "sn_1" {
  name           = format("snet-", var.project_name, "-", random_string.random_string.result)
  resource_group_name = azurerm_resource_group.rg_network.name
  address_prefix = "10.0.1.0/24"
  security_group = azurerm_network_security_group.nsg.id
}

# Subnet nr 2
resource "azurerm_subnet" "sn_2" {
  name           = format("snet-", var.project_name, "-", random_string.random_string.result)
  resource_group_name = azurerm_resource_group.rg_network.name
  address_prefix = "10.0.2.0/24"
  security_group = azurerm_network_security_group.nsg.id
}

# Giving each subnet the same NSG
resource "azurerm_subnet_network_security_group_association" "ngs_snet_assoc_1" {
  subnet_id = azurerm_subnet.sn_1.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_subnet_network_security_group_association" "ngs_snet_assoc_2" {
  subnet_id = azurerm_subnet.sn_2.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

# A network interface for the vnet
resource "azurerm_network_interface" "nic" {
  name                = format("nic-", var.project_name, "-", random_string.random_string.result)
  location            = azurerm_resource_group.rg_network.location
  resource_group_name = azurerm_resource_group.rg_network.name

  ip_configuration {
    name                          = "ip-internal-config"
    subnet_id                     = azurerm_subnet.sn_1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = var.public_ip_address_id
  }

  #Tags
  tags = var.common_tags
}