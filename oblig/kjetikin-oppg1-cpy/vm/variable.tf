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
    default = terraform.workspace == "default" ? "none" : terraform.workspace
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
    default = random_password.random_password.result
    sensitive = true

    validation {
      condition = pass.length >= 20
      error_message = "Password must be at least of length 20"
    }
}

variable "nic_id" {
    type = string
    description = "The NIC ID that the VM gets attached to"
    sensitive = true
  
}

variable "key_vault_id" {
    type = string
    description = "The Key Vault that we store the credentials to"

    // Default to empty string, meaning no kv secret is created.
    // This makes sure that the vm module is not dependent on the keyvault
    default = ""
  
}