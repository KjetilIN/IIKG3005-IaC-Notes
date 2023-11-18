variable "project_name" {
  type        = string
  description = "Project Name"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
  default     = "westeurope"

}

variable "vm_user_name" {
  type        = string
  description = "Username for the VM"
}