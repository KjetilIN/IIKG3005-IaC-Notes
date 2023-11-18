resource "azurerm_storage_container" "container" {
  name                  = format("ca-%s-%s-%s", lower(var.project_name), var.environment, var.location, random_integer.random_instance.result)
  storage_account_name  = azurerm_storage_account.st.name
  container_access_type = "private"
}