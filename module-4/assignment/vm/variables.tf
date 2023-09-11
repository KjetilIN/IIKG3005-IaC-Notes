variable "rgname" {
  type        = string
  description = "Resource group name for VM rg"
}

variable "location" {
  type        = string
  description = "Location of Azure resource deployed"
}

variable "nic_id" {
  type        = string
  description = "The NIC ID for the VNET"

}

variable "common_tags" {
    type = map(string)
    description = "Common Tags given by root module"
  
}