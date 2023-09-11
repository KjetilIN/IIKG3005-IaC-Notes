resource "azurerm_resource_group" "rg-vm" {
  name     = var.rgname
  location = var.location

}

# Public IP adress for the VM
resource "azurerm_public_ip" "pip" {
  name                = "pip-forvm"
  resource_group_name = azurerm_resource_group.rg-vm.name
  location            = azurerm_resource_group.rg-vm.location
  allocation_method   = "Static"

}

# Virtual Machine 
resource "azurerm_linux_virtual_machine" "vm" {
  name                            = "vm-linux-001"
  resource_group_name             = azurerm_resource_group.rg-vm.name
  location                        = azurerm_resource_group.rg-vm.location
  size                            = "Standard_F2"
  admin_username                  = "adminuser"
  admin_password                  = "th!s_sh0ld_n0t_b3_d0ne_l1k3_th!s"
  disable_password_authentication = false # to be able to login to vm with the virtual machine

  network_interface_ids = [var.nic_id]

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
}