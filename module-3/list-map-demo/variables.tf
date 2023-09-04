# This file contains variables 

variable "location" {
  type        = string
  description = "(optional) describe your variable"
  default     = "West Europe"
}


variable "rgname" {
  type        = string
  description = "Resource Group Name"
  default     = "rg-demo-terraform"

}

variable "saname" {
  type        = string
  description = "Storage account Name"

}

variable "company" {
  type        = string
  description = "Company Name"

}

variable "project" {
  type        = string
  description = "Project Name"

}


variable "billing_code" {
  type        = string
  description = "Billing Code"

}


# Defining a list variable 
variable "az_regions" {
  type        = list(string)
  description = "Azure array for resources"
  default     = ["westeurope", "northeurope"]
}

# Defining a map
variable "vmsize" {
  type = map(any)
  description = "Size of a VM according to Azure"
  default = {
    "small"  = "Standard_B1s",
    "medium" = "Standard_B2s"
    "large"  = "Standard_B4ms"
  }

}