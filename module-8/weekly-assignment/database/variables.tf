# Tags 
variable "common_tags" {
    type = map(string)
    description = "Common tags to attach components in this module"
}

# Project name
variable "project_name" {
    type = string
    description = "Project name used to idenitfy "
}

# Location
variable "location" {
    type = string
    description = "Location of where the resources are deployed"
}

# Sql server username and password

variable "username_sql_server" {
    type = string
    description = "Username for the SQL server"
    sensitive = true

    validation {
        condition     = length(var.username_sql_server) >= 8 && can(regex("^.*[!@#$%^&*()].*$", var.username_sql_server))
        error_message = "Username must be at least 8 characters long and contain at least one special character."
    }
  
}

variable "password_sql_server" {
    type = string
    description = "Username for the SQL server"
    sensitive = true

    validation {
        condition     = length(var.username_sql_server) >= 12 && can(regex("^.*[!@#$%^&*()].*$", var.username_sql_server))
        error_message = "Username must be at least 8 characters long and contain at least one special character."
    }
  
}

# Name of the database
variable "database_name" {
    type = string
    description = "Name to attach to the database"
    default = "db"
}

# Max size of db
variable "db_max_gb_usage" {
    type = number
    description = "Max GB that the database can use"

    validation {
        condition     = var.db_max_gb_usage > 2
        error_message = "The maximum GB usage must be greater than 2."
    }  
}
