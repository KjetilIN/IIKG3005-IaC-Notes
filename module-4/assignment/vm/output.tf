# Out file for the VM
output "public_ip_address_id" {
    value = azurerm_public_ip.pip.id
    description = "ID of Public IP Adress"
  
}