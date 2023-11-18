// Resource group for the module
resource "azurerm_resource_group" "rg" {
    name     = format("rg-%s-%s-%s-%s", lower(var.project_name), var.environment,var.location, random_integer.random_instance.result)
    location = var.location
}