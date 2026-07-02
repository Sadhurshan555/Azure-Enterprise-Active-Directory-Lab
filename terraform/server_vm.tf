####################################################
# Windows Server 2022
####################################################

resource "azurerm_windows_virtual_machine" "server" {

  name                = var.server_vm_name
  resource_group_name = azurerm_resource_group.server_rg.name
  location            = var.location

  size = var.vm_size

  admin_username = var.admin_username
  admin_password = var.admin_password

  network_interface_ids = [
    azurerm_network_interface.server_nic.id
  ]

  provision_vm_agent = true
  patch_mode         = "AutomaticByPlatform"

  secure_boot_enabled = true
  vtpm_enabled        = true

  computer_name = "SERVER2022"

  os_disk {

    name = "Server2022-OSDisk"

    caching = "ReadWrite"

    storage_account_type = "Standard_LRS"

  }

  source_image_reference {

    publisher = "MicrosoftWindowsServer"

    offer = "WindowsServer"

    sku = "2022-datacenter-azure-edition"

    version = "latest"

  }

  boot_diagnostics {
  }

  tags = {

    Environment = "Lab"

    Role = "Domain Controller"

    ManagedBy = "Terraform"

  }

}