####################################################
# Server Network Security Group
####################################################

resource "azurerm_network_security_group" "server_nsg" {

  name                = "Server-NSG"
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name

  tags = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }

}

####################################################
# Client Network Security Group
####################################################

resource "azurerm_network_security_group" "client_nsg" {

  name                = "Client-NSG"
  location            = var.location
  resource_group_name = azurerm_resource_group.client_rg.name

  tags = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }

}

####################################################
# Allow RDP ONLY From Your Public IP - Server
####################################################

resource "azurerm_network_security_rule" "server_rdp" {

  name      = "Allow-RDP-Home"
  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range      = "*"
  destination_port_range = "3389"

  source_address_prefix      = var.allowed_rdp_ip
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.server_rg.name
  network_security_group_name = azurerm_network_security_group.server_nsg.name

}

####################################################
# Allow RDP ONLY From Your Public IP - Client
####################################################

resource "azurerm_network_security_rule" "client_rdp" {

  name      = "Allow-RDP-Home"
  priority  = 100
  direction = "Inbound"
  access    = "Allow"
  protocol  = "Tcp"

  source_port_range      = "*"
  destination_port_range = "3389"

  source_address_prefix      = var.allowed_rdp_ip
  destination_address_prefix = "*"

  resource_group_name         = azurerm_resource_group.client_rg.name
  network_security_group_name = azurerm_network_security_group.client_nsg.name

}

####################################################
# Allow VNet Communication - Server
####################################################

resource "azurerm_network_security_rule" "server_vnet" {

  name      = "Allow-VNet"
  priority  = 110
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range      = "*"
  destination_port_range = "*"

  source_address_prefix      = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"

  resource_group_name         = azurerm_resource_group.server_rg.name
  network_security_group_name = azurerm_network_security_group.server_nsg.name

}

####################################################
# Allow VNet Communication - Client
####################################################

resource "azurerm_network_security_rule" "client_vnet" {

  name      = "Allow-VNet"
  priority  = 110
  direction = "Inbound"
  access    = "Allow"
  protocol  = "*"

  source_port_range      = "*"
  destination_port_range = "*"

  source_address_prefix      = "VirtualNetwork"
  destination_address_prefix = "VirtualNetwork"

  resource_group_name         = azurerm_resource_group.client_rg.name
  network_security_group_name = azurerm_network_security_group.client_nsg.name

}

####################################################
# Associate Server NIC with NSG
####################################################

resource "azurerm_network_interface_security_group_association" "server_assoc" {

  network_interface_id      = azurerm_network_interface.server_nic.id
  network_security_group_id = azurerm_network_security_group.server_nsg.id

}

####################################################
# Associate Client NIC with NSG
####################################################

resource "azurerm_network_interface_security_group_association" "client_assoc" {

  network_interface_id      = azurerm_network_interface.client_nic.id
  network_security_group_id = azurerm_network_security_group.client_nsg.id

}