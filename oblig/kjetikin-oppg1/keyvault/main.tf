terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
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


# For creating random ID with 3 characters 
resource "random_string" "random_string" {
  length  = 3
  special = false
  upper   = false
}


# To access the configuration of the AzureRM provider
data "azurerm_client_config" "current" {}

# Resource group for the keyvault resource 
resource "azurerm_resource_group" "rg_kv" {
  name     = lower(format("rg-%s-%s-%s",var.rg_kv_name ,var.project_name, var.environment))
  location = var.rg_kv_location

  # Tags
  tags = var.common_tags
}

# Key vault for holding our secrets
resource "azurerm_key_vault" "kv" {
  name                        = lower(format("kv-%s-%s", var.project_name, random_string.random_string.result))
  location                    = azurerm_resource_group.rg_kv.location
  resource_group_name         = azurerm_resource_group.rg_kv.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover",
    ]

    secret_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover",
    ]

    storage_permissions = [
      "Get", "Set", "List", "Delete", "Purge", "Recover",
    ]
  }
  # Tags
  tags = var.common_tags
}

# User name for the VM
resource "azurerm_key_vault_secret" "kvs_user" {
  name         = lower(format("kvs-%s-%s-user", var.project_name, var.environment))
  value = var.kvs_user
  key_vault_id = azurerm_key_vault.kv.id

  # Tags
  tags = var.common_tags
}

# Password for the VM
resource "azurerm_key_vault_secret" "kvs_pass" {
  name         = lower(format("kvs-%s-%s-pass", var.project_name, var.environment))
  value = var.kvs_pass
  key_vault_id = azurerm_key_vault.kv.id

  # Tags
  tags = var.common_tags
}

# Storage account access key
resource "azurerm_key_vault_secret" "st_accesskey" {
  name = lower(format("kvs-%s-%s-accesskey", var.project_name, var.environment))
  value = var.st_accesskey
  key_vault_id = azurerm_key_vault.kv.id

  # Tags
  tags = var.common_tags
  
}