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
    # Key vault features 
    key_vault {
      purge_soft_delete_on_destroy    = true
      recover_soft_deleted_key_vaults = true
    }
  }
}

# Network module
module "network" {
  source = "./network"

  # Name of the project 
  project_name = local.common_tags.project_name

  # Resource group variables 
  rg_name     = var.rg_network_name
  rg_location = var.location

  # Public IP ID of the VM that the network should support 
  pip_id = module.virtaulmachine.public_ip_address_id

  #IP adress that can access the SSH
  allowed_ip_address = var.allowed_ip_address

  # Tags
  common_tags = local.common_tags
}

# Virtual machine module
module "virtaulmachine" {
  source = "./virtualmachine"

  # Project name
  project_name = local.common_tags.project_name

  # Resource group information
  rg_name     = var.rg_vm_name
  rg_location = var.location

  # Credentials for the vm 
  vm_name     = var.vm_name
  vm_username = module.keyvault.vm_username
  vm_password = module.keyvault.vm_pass

  # The NIC ID for connecting the VM to the network
  nic_id = module.network.nic_id_output

  # Tags
  common_tags = local.common_tags

}

# Storage account module
module "storageaccount" {
  source = "./storageaccount"

  # Project name
  project_name = local.common_tags.project_name

  # Resource group information 
  rg_st_name     = var.rg_st_name
  rg_st_location = var.location

  # Tags
  common_tags = local.common_tags

}

# Key vault module
module "keyvault" {
  source = "./keyvault"

  # Project name
  project_name = local.common_tags.project_name

  # Resource group information
  rg_kv_name     = var.rg_kv_name
  rg_kv_location = var.location

  # Secrets 
  kvs_user     = var.kvs_user
  kvs_pass     = var.kvs_pass
  st_accesskey = module.storageaccount.st_access_key_output

  # Tags
  common_tags = local.common_tags

}

