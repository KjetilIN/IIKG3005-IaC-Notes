// Storage account module 
module "storage_account" {
  source = "./storage"

  // Project configuration
  project_name = var.project_name
  environment  = local.common_tags.environment
  common_tags  = local.common_tags

  // For storing the access key in a key vault (optional)
  store_access_key_in_key_vault = true
  key_vault_id = module.key_vault.key_vault_id
}

// Virtual Machine module
module "virtual_machine" {
  source = "./vm"

  // Module configuration 
  project_name = var.project_name
  environment  = local.common_tags.environment
  common_tags  = local.common_tags

  // Credentaials for the VM (Password is optional and must be at least 20 chars long)
  username = var.vm_user_name

  // Use the first nic for the VM
  nic_id = module.network.nic_ids[0]
providers = {
    
  }
  //For storing credentials in Key Vault (Optional)  
  save_credentials_in_keyvault = true
  key_vault_id = module.key_vault.key_vault_id
}


// Networking module 
module "network" {
  source = "./network"

  // Module basic configuration
  project_name = var.project_name
  location     = var.location
  environment  = local.common_tags.environment
  common_tags  = local.common_tags

  // Optional to set the subnets (Creates two by default)

  // IP address for a VM attacted to the network 
  public_ip_to_host = module.virtual_machine.public_ip_address_id
}

// A keyvault 
module "key_vault" {
  source = "./keyvault"

  // Module basic configuration
  project_name = var.project_name
  location     = var.location
  environment  = local.common_tags.environment
  common_tags  = local.common_tags
}