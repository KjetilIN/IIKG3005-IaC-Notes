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


variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
  }))

  description = "Subnets to be created for the network. Required a list of objects with name and adress prefixes. Creates two subnets by default."

  default = [ {
   
      name             = "snet-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "snet-2"
      address_prefixes = ["10.0.2.0/24"]
    }]
  validation {
    condition     = length(var.subnets) > 0
    error_message = "At least one subnet must be specified."
  }
}


variable "allowed_ip_address" {
    type = string
    description = "IP Adress that allows SSH to connect"
  
}