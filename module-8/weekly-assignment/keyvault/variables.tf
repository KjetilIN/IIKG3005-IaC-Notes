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

variable "common_tags" {
    type = map(string)
    description = "Common tags for the resources in this module"
  
}

variable "environment" {
  type        = string
  description = "Type of environment that the project is in"

}