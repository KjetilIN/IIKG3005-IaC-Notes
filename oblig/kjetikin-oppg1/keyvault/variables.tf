variable "rg_kv_name" {
    type = string
    description = "Name of the resource group for the key vault"
  
}

variable "rg_kv_location" {
    type = string
    description = "Location of the resource group for the key vault"
}

variable "project_name" {
    type = string
    description = "Name of the project"
  
}

# Secret variables 
variable "st_accesskey" {
  type = string
  description = "Storage account access key"
  sensitive = true
}

variable "kvs_user" {
    type = string
    description = "Username for the VM"
    sensitive = true
}

variable "kvs_pass" {
    type = string
    description = "Password for the VM"
    sensitive = true
}

variable "common_tags" {
    type = map(string)
    description = "Common tags for the resources in this module"
  
}