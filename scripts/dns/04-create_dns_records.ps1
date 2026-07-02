<#
===============================================================================
Azure Enterprise AD Lab
Script : 04-create_dns_records.ps1
Purpose: Create DNS A and PTR Records
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "04-create_dns_records.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "Creating DNS Records..." -ForegroundColor Cyan

# Server A Record

if (!(Get-DnsServerResourceRecord -ZoneName $DomainName -Name $ServerName -ErrorAction SilentlyContinue))
{
    Add-DnsServerResourceRecordA `
        -ZoneName $DomainName `
        -Name $ServerName `
        -IPv4Address $ServerIPAddress `
        -CreatePtr

    Write-Host "Created Server A Record"
}
else
{
    Write-Host "Server A Record already exists."
}

# Client A Record

if (!(Get-DnsServerResourceRecord -ZoneName $DomainName -Name $ClientName -ErrorAction SilentlyContinue))
{
    Add-DnsServerResourceRecordA `
        -ZoneName $DomainName `
        -Name $ClientName `
        -IPv4Address "10.0.2.4" `
        -CreatePtr

    Write-Host "Created Client A Record"
}
else
{
    Write-Host "Client A Record already exists."
}

Write-Host ""
Write-Host "Current DNS Host Records"

Get-DnsServerResourceRecord `
    -ZoneName $DomainName `
    -RRType A |
Select HostName,RecordType,@{N="IP";E={$_.RecordData.IPv4Address}}

Write-Host ""
Write-Host "Testing DNS Resolution"

Resolve-DnsName "$ServerName.$DomainName"

Resolve-DnsName "$ClientName.$DomainName"

Stop-Transcript