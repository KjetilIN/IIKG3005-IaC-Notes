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

// For creating instance number for the resource 
resource "random_integer" "random_instance" {
    min = 1
    max = 5000
}