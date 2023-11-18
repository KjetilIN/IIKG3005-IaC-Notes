// Random generation
resource "random_integer" "random_instance" {
    min = 1
    max = 5000
}

// Azurem client to access client config
data "azurerm_client_config" "current" {}

// Resource group for th 
resource "azurerm_resource_group" "rg" {
  name     = format("rg-%s-%s-%s-%s", lower(var.project_name), var.environment,var.location, random_string.random_instance.result)
  location = "West Europe"
}

resource "azurerm_key_vault" "kv" {
  name                        = format("kv-%s-%s-%s-%s", lower(var.project_name), var.environment,var.location, random_string.random_instance.result)
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}