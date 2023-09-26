# Out file for the keyvault 
output "vm_credentials" {
  value = [azurerm_key_vault_secret.kvs_user, azurerm_key_vault_secret.kvs_pass]
  description = "Credentials for the VM"
  sensitive = true
}