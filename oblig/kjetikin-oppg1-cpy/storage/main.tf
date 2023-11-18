// Resource group for the storage account
resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s-%s-%s-%s", lower(var.project_name), var.environment, var.location, random_integer.random_instance.result)
  location = var.location
}

// Storage account
resource "azurerm_storage_account" "st" {
  name                     = format("st%s%s", lower(var.project_name), random_integer.random_instance.result)
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.common_tags
}