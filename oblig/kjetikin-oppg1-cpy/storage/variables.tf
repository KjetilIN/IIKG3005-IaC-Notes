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


variable "store_access_key_in_key_vault" {
    type = bool
    description = "True if the access key should be stored in the key vault provided. False by default"
    default = false
}


variable "key_vault_id" {
    type = string
    description = "Keyvault that were the access key is stored. (Optional, but required if store_access_key_in_key_vault is set to true )"
    default = null
}
