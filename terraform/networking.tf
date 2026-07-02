####################################################
# Virtual Network
####################################################

resource "azurerm_virtual_network" "vnet" {

  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name

  address_space = var.vnet_address_space

  dns_servers = [
    var.server_private_ip
  ]

  tags = {
    Environment = "Lab"
    ManagedBy   = "Terraform"
  }

}

####################################################
# Server Subnet
####################################################

resource "azurerm_subnet" "server_subnet" {

  name                 = var.server_subnet_name
  resource_group_name  = azurerm_resource_group.server_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [
    var.server_subnet_prefix
  ]

}

####################################################
# Client Subnet
####################################################

resource "azurerm_subnet" "client_subnet" {

  name                 = var.client_subnet_name
  resource_group_name  = azurerm_resource_group.server_rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name

  address_prefixes = [
    var.client_subnet_prefix
  ]

}

####################################################
# Public IP - Server
####################################################

resource "azurerm_public_ip" "server_pip" {

  name                = "Server-PIP"
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name

  allocation_method = "Static"
  sku               = "Standard"

}

####################################################
# Public IP - Client
####################################################

resource "azurerm_public_ip" "client_pip" {

  name                = "Client-PIP"
  location            = var.location
  resource_group_name = azurerm_resource_group.client_rg.name

  allocation_method = "Static"
  sku               = "Standard"

}

####################################################
# Network Interface - Server
####################################################

resource "azurerm_network_interface" "server_nic" {

  name                = "Server-NIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.server_rg.name

  ip_configuration {

    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.server_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.server_private_ip

    public_ip_address_id = azurerm_public_ip.server_pip.id

  }

}

####################################################
# Network Interface - Client
####################################################

resource "azurerm_network_interface" "client_nic" {

  name                = "Client-NIC"
  location            = var.location
  resource_group_name = azurerm_resource_group.client_rg.name

  ip_configuration {

    name                          = "ipconfig1"
    subnet_id                     = azurerm_subnet.client_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.client_private_ip

    public_ip_address_id = azurerm_public_ip.client_pip.id

  }

}