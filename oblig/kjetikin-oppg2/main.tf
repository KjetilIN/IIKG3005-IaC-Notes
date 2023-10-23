# Random string of length 9 to make it more secure. 
# No uppercase or specialcases allowed. Intented to be unique.
resource "random_string" "random_string" {
  length  = 9
  special = false
  upper   = false
}

# Create resouce group for the web project.
resource "azurerm_resource_group" "rg_web" {
  name     = terraform.workspace == "default" ? "rg-${var.rg_name}-${random_string.random_string.result}" : "rg-${var.rg_name}-${local.common_tags.environment}-${random_string.random_string.result}"
  location = var.location

  # Tags added to the resource group
  tags = local.common_tags
}

# Create storage account for the website.
resource "azurerm_storage_account" "sa_web" {
  name                     = terraform.workspace == "default" ? "${var.sa_name}${random_string.random_string.result}" : "${var.sa_name}${local.common_tags.environment}${random_string.random_string.result}"
  resource_group_name      = azurerm_resource_group.rg_web.name
  location                 = azurerm_resource_group.rg_web.location
  min_tls_version          = "TLS1_2"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Storage account feature for static website. Has a simple index.html document 
  static_website {
    index_document = var.index_document
  }

  # Tags added to the resource group
  tags = local.common_tags
}

# Add a index.html file to the storage account.
# The content is simple for this website.
resource "azurerm_storage_blob" "index_html" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.sa_web.name
  storage_container_name = "$web" # Special function that allows for static website
  type                   = "Block"
  content_type           = "text/html"

  # Content of the website with the workspace label. 
  source_content = "${var.source_content} <br> <h3> Running: ${local.common_tags.environment}</h3>"
}