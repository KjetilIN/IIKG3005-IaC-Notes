variable "rg_backend_name" {
  type        = string
  description = "Name of the resource group for backend"
}

variable "rg_backend_location" {
  type        = string
  description = "Location og the resource group for backend"
}

variable "sa_backend_name" {
  type        = string
  description = "Name of the storage account"
}


variable "sc_backend_name" {
  type        = string
  description = "Name of the storage account"
}

variable "kv_backend_name" {
  type        = string
  description = "Name of the key vault"

}

variable "sa_backend_accesskey_name" {
  type        = string
  description = "Name of the access key"

}