<#
===============================================================================
Azure Enterprise AD Lab
Global Configuration
===============================================================================
#>

#=============================
# Domain Information
#=============================

$DomainName = "yourdomain.com"

$NetBIOSName = "YOURDOMAIN"

$SafeModePassword = "AdminPass@32145"

#=============================
# Server
#=============================

$ServerName = "Server2022"

$ServerIPAddress = "10.0.1.4"

#=============================
# Client
#=============================

$ClientName = "Win11Client"

$ClientSubnet = "10.0.2.0/24"

#=============================
# DHCP
#=============================

$ScopeName = "Corporate LAN"

$DHCPStart = "10.0.2.100"

$DHCPEnd = "10.0.2.200"

$SubnetMask = "255.255.255.0"

$Gateway = "10.0.2.1"

$LeaseDuration = 8

#=============================
# DNS
#=============================

$DNSServer = "10.0.1.4"

#=============================
# File Server
#=============================

$ShareRoot = "C:\Shares"

#=============================
# Logging
#=============================

$LogFolder = "C:\Logs"

$LogFile = "$LogFolder\AzureEnterpriseADLab.log"

#=============================
# Client
#=============================

$ClientName = "Win11Client"

$ClientIPAddress = "10.0.2.4"

$ClientSubnet = "10.0.2.0/24"