####################################
# General
####################################

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "South India"
}

####################################
# Administrator
####################################

variable "admin_username" {
  description = "Local Administrator Username"
  type        = string
  default     = "Sam"
}

variable "admin_password" {
  description = "Local Administrator Password"
  type        = string
  sensitive   = true
}

####################################
# Networking
####################################

variable "vnet_name" {
  type    = string
  default = "Corp-VNet"
}

variable "vnet_address_space" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "server_subnet_name" {
  type    = string
  default = "Server-Subnet"
}

variable "server_subnet_prefix" {
  type    = string
  default = "10.0.1.0/24"
}

variable "client_subnet_name" {
  type    = string
  default = "Client-Subnet"
}

variable "client_subnet_prefix" {
  type    = string
  default = "10.0.2.0/24"
}

####################################
# Resource Groups
####################################

variable "server_rg_name" {
  type    = string
  default = "RG-Server"
}

variable "client_rg_name" {
  type    = string
  default = "RG-Client"
}

####################################
# VM Names
####################################

variable "server_vm_name" {
  type    = string
  default = "Server2022"
}

variable "client_vm_name" {
  type    = string
  default = "Win11Client"
}

####################################
# VM Size
####################################

variable "vm_size" {
  type    = string
  default = "Standard_B2s"
}

####################################
# Static Private IPs
####################################

variable "server_private_ip" {
  type    = string
  default = "10.0.1.4"
}

variable "client_private_ip" {
  type    = string
  default = "10.0.2.4"
}

####################################
# Allowed RDP Source
####################################

variable "allowed_rdp_ip" {
  description = "Public IP allowed for RDP"
  type        = string
  default     = allowed_rdp_ip
}