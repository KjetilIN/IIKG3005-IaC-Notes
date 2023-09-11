# Output variable is the nic for the VM
output "vnet-nic-output-id" {
  value = azurerm_network_interface.nic.id
}