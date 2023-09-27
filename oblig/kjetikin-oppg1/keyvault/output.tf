# Out file for the keyvault 
output "vm_username" {
  value = azurerm_key_vault_secret.kvs_user.value
  description = "Username for the VM"
  sensitive = true
}

output "vm_pass" {
  value = azurerm_key_vault_secret.kvs_pass.value
  description = "Password for the VM"
  sensitive = true
}