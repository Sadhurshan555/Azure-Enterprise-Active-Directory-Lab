<#
===============================================================================
Azure Enterprise AD Lab
Script : 02-promote_domain_controller.ps1
Purpose: Promote Server to Domain Controller
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "==============================================" -ForegroundColor Cyan
Write-Host "Promoting Server to Domain Controller"
Write-Host "==============================================" -ForegroundColor Cyan

# Verify AD DS Role
$Feature = Get-WindowsFeature AD-Domain-Services

if (!$Feature.Installed)
{
    Write-Host "AD DS Role is not installed." -ForegroundColor Red

    Stop-Transcript

    exit 1
}

# Check if already promoted
try
{
    Get-ADDomain | Out-Null

    Write-Host ""
    Write-Host "This server is already a Domain Controller." -ForegroundColor Yellow

    Stop-Transcript

    exit 0
}
catch
{
    Write-Host "Server is not yet promoted." -ForegroundColor Green
}

# Convert Password
$DSRMPassword = ConvertTo-SecureString `
$SafeModePassword `
-AsPlainText `
-Force

# Promote Domain Controller

Install-ADDSForest `
    -DomainName $DomainName `
    -DomainNetbiosName $NetBIOSName `
    -SafeModeAdministratorPassword $DSRMPassword `
    -InstallDNS `
    -Force `
    -NoRebootOnCompletion

Write-Host ""
Write-Host "Domain Controller Promotion Completed Successfully." -ForegroundColor Green

Stop-Transcript

Restart-Computer -Force