# Output for the network module
output "nic_id_output" {
    value = azurerm_network_interface.nic.id
    description = "NIC ID that is connected to the network"
}