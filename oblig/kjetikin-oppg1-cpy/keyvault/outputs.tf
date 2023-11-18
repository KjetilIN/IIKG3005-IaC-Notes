// Output the keyvault id for others to use 
output "key_vault_id" {
    value = azurerm_key_vault.kv.id
}