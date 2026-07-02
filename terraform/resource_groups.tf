#####################################################
# Resource Group - Server
#####################################################

resource "azurerm_resource_group" "server_rg" {

  name     = var.server_rg_name
  location = var.location

  tags = {
    Environment = "Lab"
    Project     = "Azure Enterprise Lab"
    Role        = "Server"
    ManagedBy   = "Terraform"
  }

}

#####################################################
# Resource Group - Client
#####################################################

resource "azurerm_resource_group" "client_rg" {

  name     = var.client_rg_name
  location = var.location

  tags = {
    Environment = "Lab"
    Project     = "Azure Enterprise Lab"
    Role        = "Client"
    ManagedBy   = "Terraform"
  }

}