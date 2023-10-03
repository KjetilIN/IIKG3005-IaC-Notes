terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }

  backend "azurerm" {
    resource_group_name = "kjetikin-backend"
    storage_account_name = "ksabetfsopr0ue6r57"
    container_name = "tfstate"
    key = "backend.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# For creating random stings
resource "random_string" "random_string" {
  length  = 10
  special = false
  upper   = false
}


resource "azurerm_resource_group" "rg_backend" {
  name     = var.rg_backend_name
  location = var.rg_backend_location
}

# Storage account
resource "azurerm_storage_account" "sa_backend" {
  name                     = "${lower(var.sa_backend_name)}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_backend.name
  location                 = azurerm_resource_group.rg_backend.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "sa_backend" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa_backend.name
  container_access_type = "private"
}


## KEYVAULT 

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv_backend" {
  name                        = "${var.kv_backend_name}${random_string.random_string.result}"
  location                    = azurerm_resource_group.rg_backend.location
  resource_group_name         = azurerm_resource_group.rg_backend.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id


    # This is all of the premissions for each type
    key_permissions = [
      "Get", "List", "Create", "Delete"
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete"
    ]

    storage_permissions = [
      "Get", "Set", "List", "Delete"
    ]
  }
}

# A secret in the key vault, here the key that we are storing is the primary access key for the sa
resource "azurerm_key_vault_secret" "sa_backend_accesskey" {
  name         = "${lower(var.sa_backend_accesskey_name)}${random_string.random_string.result}"
  value        = azurerm_storage_account.sa_backend.primary_access_key
  key_vault_id = azurerm_key_vault.kv_backend.id
}