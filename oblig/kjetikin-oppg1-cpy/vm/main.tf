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
  count = length(var.usernames)
  name                = lower(format("pip-%s-%s-%s",var.project_name, var.environment, random_integer.random_instance.result))
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

  // Tags
  tags = var.common_tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  count = length(var.usernames)
  name                = format("vm-ssh-%s-%s", var.environment,random_integer.random_instance.result)
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_F2"

  
  // Credentials 
  admin_username      = var.usernames[count.index]
  admin_password                  = var.passwords == null ? random_password.random_password.result : var.passwords[count.index]
  disable_password_authentication = false 

  // Nic Id attached to a VM
  network_interface_ids = [ var.nic_ids[count.index]]

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
    count = var.save_credentials_in_keyvault == true ? length(var.usernames) : 0

    name = format("username-secret-%s", count.index)
    value = var.usernames[count.index]
    key_vault_id = var.key_vault_id
  
}

resource "azurerm_key_vault_secret" "pass_secret" {
    // Check if the keyvault id has been provided
    count = var.save_credentials_in_keyvault == true ? length(azurerm_linux_virtual_machine.vm) : 0

    name = format("pass-secret-%s", count.index)
    value = azurerm_linux_virtual_machine.vm[count.index].admin_password
    key_vault_id = var.key_vault_id
}