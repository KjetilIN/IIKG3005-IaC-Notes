# Variables for the Tag

variable "project_id" {
  type        = string
  description = "Project ID"

}

variable "company" {
  type    = string
  default = "Company name"

}

variable "billing_department" {
  type = string
  description = "Department that should be billed"
  
}


# Resouce Group

variable "rg-networking-name" {
  type        = string
  description = "Resources Group Name"
}

# Location

variable "location" {
  type = string
  description = "Location"

}

# VNET name

variable "vnet-names" {
  type        = list(string)
  description = "Names of the VNET"
  default     = ["vnet-fin", "vnet-corp"]

}

# Subnet name

variable "subnet-name" {
  type        = string
  default     = "sn-we"
  description = "Name of the subnetwork"

}


# Storage Account names
variable "sa-names" {
  type        = list(string)
  description = "Names of all storage accounts"
  default     = ["safin", "sait", "sacorp"]
}

# Storage Account Resouces group

variable "rg-sa-name" {
  type        = string
  description = "Resourcegroup Name for SA"
}