resource "random_string" "random_string" {
    length = 8
    special = false
    upper = false
}

# Create resouce group
resource "azurerm_resource_group" "rg_web" {
    name = var.rg_name
    location = var.location
}

# Create storage account
resource "azurerm_storage_account" "sa_web" {
    name = "${var.sa_name}${random_string.random_string.result}"
    resource_group_name = azurerm_resource_group.rg_web.name
    location = azurerm_resource_group.rg_web.location
    account_tier = "Standard"
    account_replication_type = "LRS"

    # Storage account feature for static website
    static_website {
      index_document = var.index_document
    }
}

# Add a index.html file to the storage account
resource "azurerm_storage_blob" "index_html" {
    name = var.index_document
    storage_account_name = azurerm_storage_account.sa_web.name
    storage_container_name = "$web" # Special function that allows for static website
    type = "Block"
    content_type = "text/html"
    source_content = var.source_content # Content of the website here
}

output "primary_web_endpoint" {
    value = azurerm_storage_account.sa_web.primary_web_endpoint
  
}