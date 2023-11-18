// Create a new secret that has the access key
// Store it in the keyvault if a keyvault id is given
resource "azurerm_key_vault_secret" "acess_key_secret" {
    // Checks if given, else it does not create the resource
    count = var.key_vaul_id == "" ? 0 : 1
    name = "st-access-key"
    value = azurerm_storage_account.st.primary_access_key
    key_vault_id = var.key_vaul_id
}