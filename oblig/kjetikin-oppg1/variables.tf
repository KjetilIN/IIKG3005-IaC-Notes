# Variables for locals common tags:

variable "company_name" {
  type        = string
  description = "Name of company"
}

variable "billing_code" {
  type        = string
  description = "The billing code of the company"
}

variable "department" {
  type        = string
  description = "Name of the department that is responsible for the project"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Type of environment that the project is in"

}

# Variables for the root module

variable "location" {
  type        = string
  description = "Location of the project for the root module and all child modules"

}

variable "rg_network_name" {
  type        = string
  description = "Name of the resource group for the network module"

}

variable "rg_vm_name" {
  type        = string
  description = "Name of the resource group for the virtual machine module"

}

variable "rg_st_name" {
  type        = string
  description = "Name of the resource group for the virtual machine module"
}

variable "rg_kv_name" {
  type        = string
  description = "Name of the resource group for the key vault"

}

variable "vm_name" {
  type        = string
  description = "Name of the virtual machine"

}

# Credentials for vm

variable "kvs_user" {
  type        = string
  description = "Username for the VM"
  sensitive   = true
}

variable "kvs_pass" {
  type        = string
  description = "Password for the VM"
  sensitive   = true
}

