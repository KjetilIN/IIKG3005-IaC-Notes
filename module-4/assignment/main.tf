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

# The VNET Module
module "vnet" {
  source               = "./vnet"
  base_name            = "kjetil"
  location             = "westeurope"
  public_ip_address_id = module.vm.public_ip_address_id
  common_tags = local.common_tags
}

# The VM Module
module "vm" {
  source   = "./vm"
  rgname   = "kjetil-vmrg"
  location = "westeurope"
  nic_id   = module.vnet.vnet-nic-output-id # Using the VNET output for the VM Module! 
  common_tags = local.common_tags
}