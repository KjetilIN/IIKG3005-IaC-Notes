variable "location" {
  type        = string
  description = "Location of the resource"
  default     = "westeurope"
}

variable "rg_name" {
  type        = string
  description = "Name of the resource group"
  default     = "web"
}

variable "sa_name" {
  type        = string
  description = "Storage account name"
  default     = "sa"
}

variable "source_content" {
  type        = string
  description = "Content of the website"
  default     = "<h1>Terraform - CI/CD</h1>"

}

variable "index_document" {
  type        = string
  description = "Name of the index html document"
  default     = "index.html"
}