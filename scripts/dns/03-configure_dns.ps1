<#
===============================================================================
Azure Enterprise AD Lab
Script : 03-configure_dns.ps1
Purpose: Configure DNS
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "03-configure_dns.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "========================================="
Write-Host "DNS Configuration"
Write-Host "========================================="
Write-Host ""

# Check DNS Service

$DNS = Get-Service DNS

if ($DNS.Status -ne "Running")
{
    Start-Service DNS
}

Write-Host "DNS Service Running" -ForegroundColor Green

# Verify Forward Lookup Zone

$ForwardZone = Get-DnsServerZone -Name $DomainName -ErrorAction SilentlyContinue

if ($null -eq $ForwardZone)
{
    Write-Host "Forward Lookup Zone not found." -ForegroundColor Red
}
else
{
    Write-Host "Forward Lookup Zone exists." -ForegroundColor Green
}

# Verify Reverse Lookup Zone

$ReverseZone = Get-DnsServerZone |
Where-Object {$_.ZoneName -like "*.in-addr.arpa"}

if ($null -eq $ReverseZone)
{
    Write-Host "Reverse Lookup Zone not found." -ForegroundColor Yellow
    Write-Host "Create it manually or in the next script."
}
else
{
    Write-Host "Reverse Lookup Zone exists." -ForegroundColor Green
}

Write-Host ""

Write-Host "Configured Zones"

Get-DnsServerZone |
Format-Table ZoneName,ZoneType,IsReverseLookupZone

Stop-Transcript