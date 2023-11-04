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

variable "password_sql_server" {
  type        = string
  description = "Username for the SQL server"
  sensitive   = true

  validation {
    condition     = length(var.username_sql_server) >= 12 && can(regex("^.*[!@#$%^&*()].*$", var.username_sql_server))
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


  validation {
    # Validation for ensuring that each database has a name specified
    condition     = can(index(keys(var.databases), each.key)) && length(each.value.name) > 0
    error_message = "Each database must have a 'name' specified."
  }

  validation {
    # Validation for ensuring max_size_gb is more than 2
    condition     = each.value.max_size_gb > 2
    error_message = "The 'max_size_gb' for each database must be greater than 2."
  }

  default = {}
}

