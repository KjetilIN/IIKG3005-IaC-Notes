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

# Resource group for the storage account 
resource "azurerm_resource_group" "rg_st" {
  name     = var.rg_st_name
  location = var.rg_st_location

  #Tags
  tags = var.common_tags
}

# Storage account
resource "azurerm_storage_account" "st" {
  name                     = format("st",lower(var.project_name), random_string.random_string.result)
  resource_group_name      = azurerm_resource_group.rg_st.name
  location                 = azurerm_resource_group.rg_st.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  #Tags
  tags = var.common_tags

}

# Storage container for the storage account 
resource "azurerm_storage_container" "sc" {
  name                  = format("sc",lower(var.project_name), random_string.random_string.result)
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}