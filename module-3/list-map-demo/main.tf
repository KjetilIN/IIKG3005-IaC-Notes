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

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.az_regions[0] # Fist element in the list
  tags     = local.common_tags
}

resource "azurerm_storage_account" "sa" {
  name                     = var.saname
  resource_group_name      = azurerm_resource_group.rgwe.name
  location                 = azurerm_resource_group.rgwe.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.common_tags

}