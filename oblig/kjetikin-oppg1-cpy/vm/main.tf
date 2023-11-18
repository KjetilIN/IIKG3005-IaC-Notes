// For generating instance id
resource "random_integer" "random_instance" {
    min = 1
    max = 5000
}

// For generating password with length 20 
resource "random_password" "random_password" {
    length = 20
}

resource "azurerm_resource_group" "rg" {
    name     = format("rg-%s-%s-%s-%s", lower(var.project_name), var.environment,var.location, random_integer.random_instance.result)
    location = var.location
}

// IP adress for the 
resource "azurerm_public_ip" "pip" {
  name                = lower(format("pip-%s-%s-%s",var.project_name, var.environment, random_integer.random_instance.result))
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  // Tags
  tags = var.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = format("vm-ssh-%s-%s", var.environment,random_integer.random_instance.result)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"

  
  // Credentials 
  admin_username      = var.username 
  admin_password                  = var.password == null ? random_password.random_password.result : var.password
  disable_password_authentication = false 

  // NIC ID 
  network_interface_ids = [ var.nic_id ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}


// Storing the credentials in a keyvault 
resource "azurerm_key_vault_secret" "username_secret" {
    // Check if the keyvault id has been provided
    count = var.save_credentials_in_keyvault == true ? 1 : 0

    name = "username-secret"
    value = var.username
    key_vault_id = var.key_vault_id
  
}

resource "azurerm_key_vault_secret" "pass_secret" {
    // Check if the keyvault id has been provided
    count = var.save_credentials_in_keyvault == true ? 1 : 0

    name = "pass-secret"
    value = azurerm_linux_virtual_machine.vm.admin_password
    key_vault_id = var.key_vault_id
}