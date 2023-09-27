variable "rg_name" {
    type = string
    description = "Resource group name for the virtual machine module"
  
}

variable "rg_location" {
  type = string
  description = "Resource group location for the virtual machine module"
}

variable "vm_name" {
    type = string
    description = "Name of the virtual machine"
}


variable "nic_id" {
    type = string
    description = "The ID of the NIC that should be connected to the VM"
  
}

variable "vm_username" {
    type = string
    description = "Username for the vm"
  
}

variable "vm_password" {
    type = string
    description = "Password for the vm"
  
}

variable "common_tags" {
    type = map(string)
    description = "Common tags for the resources in this module"
  
}