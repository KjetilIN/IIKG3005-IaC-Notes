# Tags 
variable "common_tags" {
  type        = map(string)
  description = "Common tags to attach components in this module"
}

# Project name
variable "project_name" {
  type        = string
  description = "Project name used to idenitfy "
}

# Location
variable "location" {
  type        = string
  description = "Location of where the resources are deployed"
}

# Sql server username and password

variable "username_sql_server" {
  type        = string
  description = "Username for the SQL server"
  sensitive   = true

  validation {
    condition     = length(var.username_sql_server) >= 8 && can(regex("^.*[!@#$%^&*()].*$", var.username_sql_server))
    error_message = "Username must be at least 8 characters long and contain at least one special character."
  }

}

# Name of the database
variable "databases" {
  type = map(object({
    name        = string
    max_size_gb = number
  }))
  description = "Map of databases and their configurations"
  default = {}
}


# Variable for keyvault id
variable "key_vault_id" {
  type = string
  description = "Keyvault ID"
  sensitive = true
}
