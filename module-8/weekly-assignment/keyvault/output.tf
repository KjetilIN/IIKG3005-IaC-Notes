# Out file for the keyvault 
output "key_vault_id" {
  value = azurerm_key_vault.kv.id
  description = "Keyvault ID"
}


