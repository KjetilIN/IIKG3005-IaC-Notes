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
    key                  = "oblig-2-web-app.terraform.tfstate" # State file for oblig 2
  }
}

# Using Azurerm to deploy the project.
# No features provided.
provider "azurerm" {
  features {

  }
}

