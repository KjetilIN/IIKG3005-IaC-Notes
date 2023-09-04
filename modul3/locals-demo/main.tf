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

locals {
  name = "LearinIT"
  tags ={
    enviroment = "Production"
    costcenter = "IT"
    owner = "Kjetil Indrehus"
  }
}

resource "azurerm_resource_group" "rgwe" {
  name     = var.rgname
  location = var.location
}

resource "azurerm_storage_account" "sa-demo" {
  name = "sa-name"
  resource_group_name = var.rgname
  location = var.location
  account_tier = "Standard"
  account_replication_type = "LRS"

  tags = {}
  
}