variable "rg_name" {
    type = string
    description = "Name of the RG for the network module"
}

variable "rg_location" {
  type = string
  description = "Location of the RG for the network module"
}

variable "project_name" {
    type = string
    description = "Name of the project. Used to uniquly identiy the resources for the Network Module"
  
}

variable "pip_id" {
    type = string
    description = "ID of the public IP adress for the NIC"
  
}

variable "allowed_ip_address" {
    type = string
    description = "IP address that is allowed to SSH to the network"
    sensitive = true
  
}

variable "common_tags" {
    type = map(string)
    description = "Common tags for the resources in this module"
  
}

variable "environment" {
  type        = string
  description = "Type of environment that the project is in"

}