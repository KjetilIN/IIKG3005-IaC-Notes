variable "project_name" {
  type = string
  description = "Name of the project"
}

variable "rg_st_name" {
    type = string
    description = "Name of the resource group for the storage account"
}

variable "rg_st_location" {
  type = string
  description = "Location of resource group for the storage account"
}

variable "common_tags" {
    type = map(string)
    description = "Common tags for the resources in this module"
  
}

variable "environment" {
  type        = string
  description = "Type of environment that the project is in"

}