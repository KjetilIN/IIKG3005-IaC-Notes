# Random string of length 9 to make instance id
resource "random_string" "random_string" {
  length  = 9
  special = false
  upper   = false
}

# Resource for generating the password
resource "random_string" "passgen" {
  length  = 14
  special = true
  upper   = true
  min_lower = 1
  min_numeric = 1
  min_special = 1
  min_upper = 1
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
  administrator_login          = azurerm_key_vault_secret.kv_user.value
  administrator_login_password = azurerm_key_vault_secret.kv_pass.value
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

# Store credentials in the keyvault
resource "azurerm_key_vault_secret" "kv_user" {
  name         = "SQL Server Username"
  value        = var.username_sql_server
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "kv_pass" {
  name         = "SQL Server Username"
  value        = random_string.passgen.result
  key_vault_id = var.key_vault_id
}

# Store the connection string in the keyvault
resource "azurerm_key_vault_secret" "kvs_connection_string" {
  name         = "sql-connectionstring"
  value        = "Server=tcp:${azurerm_sql_server.server.fully_qualified_domain_name}.database.windows.net,1433;Persist Security Info=False;User ID=${azurerm_key_vault_secret.kv_user.value};Password=${azurerm_key_vault_secret.kv_pass.value};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
  key_vault_id = var.key_vault_id
}
