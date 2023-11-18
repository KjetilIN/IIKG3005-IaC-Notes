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

variable "username" {
    type = string
    description = "Username of the virtual machine"
    sensitive = true 
}

variable "password" {
    type = string
    description = "The password to the virtual machine. Creates password by default"
    default = null
    sensitive = true

    validation {
      // If the password is null, we will be generating the password, else check if it is 20 chars long
      condition = var.password == null ? true : length(var.password) >= 20
      error_message = "Password must be at least of length 20"
    }
}

variable "nic_id" {
    type = string
    description = "The NIC ID that the VM gets attached to"
    sensitive = true
  
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