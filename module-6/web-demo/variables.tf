variable "location" {
    type = string
    description = "Location of the resource"
}

variable "rg_name" {
    type = string
    description = "Name of the resource group"
}

variable "sa_name" {
    type = string
    description = "Storage account name"
}

variable "source_content" {
    type = string
    description = "Content of the website"
}

variable "index_document" {
    type = string
    description = "Name of the index html document"
    default = "index.html"
  
}