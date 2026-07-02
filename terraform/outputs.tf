####################################################
# Server Outputs
####################################################

output "server_vm_name" {
  description = "Windows Server VM Name"
  value       = azurerm_windows_virtual_machine.server.name
}

output "server_public_ip" {
  description = "Server Public IP"
  value       = azurerm_public_ip.server_pip.ip_address
}

output "server_private_ip" {
  description = "Server Private IP"
  value       = azurerm_network_interface.server_nic.private_ip_address
}

####################################################
# Client Outputs
####################################################

output "client_vm_name" {
  description = "Windows 11 VM Name"
  value       = azurerm_windows_virtual_machine.client.name
}

output "client_public_ip" {
  description = "Client Public IP"
  value       = azurerm_public_ip.client_pip.ip_address
}

output "client_private_ip" {
  description = "Client Private IP"
  value       = azurerm_network_interface.client_nic.private_ip_address
}

####################################################
# Network Outputs
####################################################

output "virtual_network_name" {
  value = azurerm_virtual_network.vnet.name
}

output "server_subnet" {
  value = azurerm_subnet.server_subnet.address_prefixes
}

output "client_subnet" {
  value = azurerm_subnet.client_subnet.address_prefixes
}