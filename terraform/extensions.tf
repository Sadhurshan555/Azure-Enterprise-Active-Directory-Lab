resource "azurerm_virtual_machine_extension" "install_roles" {

  name                 = "InstallServerRoles"

  virtual_machine_id   = azurerm_windows_virtual_machine.server.id

  publisher            = "Microsoft.Compute"

  type                 = "CustomScriptExtension"

  type_handler_version = "1.10"

  settings = <<SETTINGS
{
  "commandToExecute": "powershell -ExecutionPolicy Bypass -Command \"Install-WindowsFeature AD-Domain-Services,DNS,DHCP -IncludeManagementTools; Restart-Computer -Force\""
}
SETTINGS

  depends_on = [
    azurerm_windows_virtual_machine.server
  ]

}