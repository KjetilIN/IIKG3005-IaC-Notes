variable "base_name" {
  type        = string
  description = "Base name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of Azure resource deployed"

}

variable "public_ip_address_id" {
  type = string
  description = "Public IP Adress for the VM"
}

variable "common_tags" {
    type = map(string)
    description = "Common tags by the root folder"
  
}