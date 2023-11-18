provider "azurerm" {
  features {
  }
}

// For creating instance number for the resource 
resource "random_integer" "random_instance" {
    min = 1
    max = 5000
}