# Output of the storage account
output "st_access_key_output" {
    value = azurerm_storage_account.st.primary_access_key
    description = "Access key of the storage account"
    sensitive = true
}