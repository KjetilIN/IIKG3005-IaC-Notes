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


# Location
variable "location" {
  type        = string
  description = "Location of where the resources are deployed"
}