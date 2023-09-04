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