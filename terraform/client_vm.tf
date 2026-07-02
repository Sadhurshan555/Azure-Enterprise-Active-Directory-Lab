resource "azurerm_windows_virtual_machine" "client" {

  name                = var.client_vm_name
  resource_group_name = azurerm_resource_group.client_rg.name
  location            = var.location

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.client_nic.id
  ]

  computer_name = "CLIENT01"

  os_disk {
    name                 = "Client-OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "windows-11"
    sku       = "win11-24h2-pro"
    version   = "latest"
  }

  boot_diagnostics {}

  tags = {
    Environment = "Lab"
    Role        = "Client"
    ManagedBy   = "Terraform"
  }

  depends_on = [
    azurerm_network_interface_security_group_association.client_assoc
  ]
}