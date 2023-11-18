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