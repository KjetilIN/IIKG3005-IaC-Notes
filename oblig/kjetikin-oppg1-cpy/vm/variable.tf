variable "project_name" {
    type = string
    description = "Project Name"
}

variable "location" {
    type = string
    description = "Location of the resource group"
    default = "westeurope"
  
}

variable "environment" {
    type = string
    description = "Environment of the configuration"
}


variable "common_tags" {
    type = map(string)
    description = "Tags to be added to the resources in the module" 
}

variable "usernames" {
    type = list(string)
    description = "Usernames of the virtual machine"
    sensitive = true 
}

variable "passwords" {
    type = list(string)
    description = "The password to the virtual machine. Creates password by default"
    default = null
    sensitive = true

    validation {
      // If the password is null, we will be generating the password, else check if it is 20 chars long
      condition = var.passwords == null ? true : length(var.passwords) >= 20
      error_message = "Password must be at least of length 20"
    }
}

variable "nic_ids" {
    type = list(string)
    description = "The NIC IDs that the VMs gets attached to"
}


variable "save_credentials_in_keyvault" {
    type = bool
    description = "Condition that is true, if there is a keyvault that we want to store the login credentials to"
    default = false
  
}

variable "key_vault_id" {
    type = string
    description = "The Key Vault that we store the credentials to. The save_credentials_in_keyvault must also be true."

    // Default to empty string, meaning no kv secret is created.
    // This makes sure that the vm module is not dependent on the keyvault
    default = ""
  
}