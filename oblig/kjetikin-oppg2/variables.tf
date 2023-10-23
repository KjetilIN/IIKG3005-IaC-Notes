# Company name
variable "company_name" {
  type        = string
  description = "Name of the company"
}

# Billing code for the resource
variable "billing_code" {
  type        = string
  description = "Billing code for the resource"
}

# Departmant of the organisation 
variable "department" {
  type        = string
  description = "Department that the resource belongs to."

  validation {
    condition     = contains(["it", "pr", "corp", "hr"], var.department)
    error_message = "Incorrect department given"
  }
}

# Project name
variable "project_name" {
  type        = string
  description = "Name of the project"
}

# Location of where the resources are deployed
variable "location" {
  type        = string
  description = "Location of the resource"
  default     = "westeurope"
}

# Resource groupe name
variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default     = "web"
}

# Storage Account Name
variable "sa_name" {
  type        = string
  description = "Storage account name"
  default     = "sa"
}

# Main content for the website as HTML code
variable "source_content" {
  type        = string
  description = "Content of the website"
  default     = "<h1>Oblig 2 - Terraform</h1>"

}


#Name of the index document for the website 
variable "index_document" {
  type        = string
  description = "Name of the index html document"
  default     = "index.html"
}