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

variable "enviroment" {
  type        = string
  description = "Type of envirement that the project is in"

}