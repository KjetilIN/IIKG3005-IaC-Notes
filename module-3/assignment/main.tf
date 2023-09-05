terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }
}

provider "azurerm" {
  features {

  }
}


#Resouce group for networking
resource "azurerm_resource_group" "rg-networking" {
  name     = var.rg-networking-name
  location = var.location
  tags     = local.common_tags
}

# VNET
resource "azurerm_virtual_network" "vnet" {
  count               = length(var.vnet-names)
  name                = "${var.vnet-names[count.index]}-001"
  location            = azurerm_resource_group.rg-networking.location
  resource_group_name = azurerm_resource_group.rg-networking.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "${var.subnet-name}-${count.index + 1}-001"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "${var.subnet-name}-${count.index + 1}-002"
    address_prefix = "10.0.2.0/24"
  }

  tags = local.common_tags
}


# RG for Storage Account
resource "azurerm_resource_group" "rg-sa" {
  name     = var.rg-sa-name
  location = var.location
  tags     = local.common_tags
}


# Storage Accounts x 3
resource "azurerm_storage_account" "sa" {
  count                    = length(var.sa-names)
  name                     = "${var.sa-names[count.index]}${count.index}"
  resource_group_name      = azurerm_resource_group.rg-sa.name
  location                 = azurerm_resource_group.rg-sa.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags
}




