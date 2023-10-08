terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.69.0"
    }
  }

  # Using an existing backend
  backend "azurerm" {
    resource_group_name  = "kjetikin-backend"
    storage_account_name = "ksabetfsopr0ue6r57"
    container_name       = "tfstate"
    key                  = "oblig1.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
    # Key vault features 
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}