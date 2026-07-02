<#
===============================================================================
Azure Enterprise AD Lab
Script : 05-configure_dhcp.ps1
Purpose: Configure DHCP Server
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "05-configure_dhcp.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==========================================="
Write-Host "Configuring DHCP Server"
Write-Host "==========================================="

# Authorize DHCP Server

Add-DhcpServerInDC `
    -DnsName "$ServerName.$DomainName" `
    -IPAddress $ServerIPAddress `
    -ErrorAction SilentlyContinue

Write-Host "DHCP Server Authorized"

# Create Scope

if (!(Get-DhcpServerv4Scope -ErrorAction SilentlyContinue))
{
    Add-DhcpServerv4Scope `
        -Name $ScopeName `
        -StartRange $DHCPStart `
        -EndRange $DHCPEnd `
        -SubnetMask $SubnetMask `
        -State Active

    Write-Host "DHCP Scope Created"
}
else
{
    Write-Host "DHCP Scope Already Exists"
}

# Configure Scope Options

Set-DhcpServerv4OptionValue `
    -DnsServer $DNSServer `
    -DnsDomain $DomainName `
    -Router $Gateway

Write-Host "DHCP Options Configured"

Write-Host ""
Write-Host "Current DHCP Scopes"

Get-DhcpServerv4Scope

Stop-Transcript