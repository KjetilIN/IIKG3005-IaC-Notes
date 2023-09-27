# Resource group for the virtual machine
resource "azurerm_resource_group" "rg_vm" {
    name = var.rg_name
    location = var.rg_location
}

# Public IP adress for the VM
resource "azurerm_public_ip" "pip" {
  name                = format("pip-forvm-"+rg_name)
  resource_group_name = azurerm_resource_group.rg-vm.name
  location            = azurerm_resource_group.rg-vm.location
  allocation_method   = "Static"

  #Tags
  tags = var.common_tags
}

# Virtual Machine - Linux by default
resource "azurerm_linux_virtual_machine" "vm" {
  name                = format("vm-", lower(var.vm_name)) # TODO: Check naming convention
  resource_group_name = azurerm_resource_group.rg_vm.name
  location            = azurerm_resource_group.rg_vm.location
  size                = "Standard_F2"

  # Credentials for login to the VM
  admin_username                  = var.vm_username
  admin_password                  = var.vm_password
  disable_password_authentication = false 

  # NIC ID 
  network_interface_ids = [ var.nic_id ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  #Tags
  tags = var.common_tags
}