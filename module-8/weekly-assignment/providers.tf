terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.73.0"
    }
  }

  # Using an existing backend
  backend "azurerm" {
    resource_group_name  = "kjetikin-backend"
    storage_account_name = "ksabetfsopr0ue6r57"
    container_name       = "tfstate"
    key                  = "database-module-demo.terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}

