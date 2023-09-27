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

# Network module
module "network" {
  source = "./network"

  # Name of the project 
  project_name = local.common_tags.project_name

  # Resource group variables 
  rg_name = var.rg_network_name
  rg_location = var.location

  # Public IP ID of the VM that the network should support 
  pip_id = module.virtaulmachine.public_ip_address_id
}

# Virtual machine module
module "virtaulmachine" {
  source = "./virtualmachine"

  # Resource group information
  rg_name = var.rg_vm_name
  rg_location = var.location

  # Credentials for the vm 
  vm_name = var.vm_name
  vm_username = module.keyvault.vm_credentials[0]
  vm_password = module.keyvault.vm_credentials[1]

  # The NIC ID for connecting the VM to the network
  nic_id = module.network.nic_id_output
  
}

# Storage account module
module "storageaccount" {
  source = "./storageaccount"

  # Project name
  project_name = local.common_tags.project_name

  # Resource group information 
  rg_st_name = var.rg_st_name
  rg_st_location = var.location
  
}

# Key vault module
module "keyvault" {
  source = "./keyvault"

  # Project name
  project_name = local.common_tags.project_name

  # Resource group information
  rg_kv_name = var.rg_name
  rg_kv_location = var.location
  
}

