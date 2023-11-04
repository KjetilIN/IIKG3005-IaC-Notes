# Random string of length 9 to make instance id
resource "random_string" "random_string" {
  length  = 9
  special = false
  upper   = false
}

# Resource group
resource "azurerm_resource_group" "rg" {
  name     = lower(format("rg-%s-database", var.project_name))
  location = var.location
}

# Storage Account for the databae
resource "azurerm_storage_account" "example" {
  name                     = lower(format("sa%s%s", var.project_name, random_string.random_string.result))
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

# SQL Server
resource "azurerm_mssql_server" "server" {
  name                         = lower(format("sqlserver-%s-%s", var.project_name, random_string.random_string.result))
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = var.username_sql_server
  administrator_login_password = var.password_sql_server
}

# SQL Databases
resource "azurerm_mssql_database" "db" {
  # Create a a database for each value in the databases 
  for_each = var.databases

  name           = lower(format("sqldb-%s-%s-%s", var.project_name, each.value["name"], random_string.random_string.result))
  server_id      = azurerm_mssql_server.server.id
  collation      = "SQL_WestEurope_DB_1"
  license_type   = "LicenseIncluded"
  max_size_gb    = each.value["max_size_gb"]
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

  tags = each.value.common_tags
}