resource "azurerm_resource_group" "example" {
  name = "${var.base_name}-no"
  location =  var.location
}