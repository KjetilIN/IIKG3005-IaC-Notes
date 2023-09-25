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


# Defining a module 
module "ResouceGroup" {
  source    = "./ResourceGroup"
  base_name = "tf-demo"
  location  = "westeurope"

}

module "StorageAccount" {
  source    = "./StorageAccount"
  base_name = "TFdemo"
  rgname    = module.ResouceGroup.rg_name_output
  location  = "westeurope"
}