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