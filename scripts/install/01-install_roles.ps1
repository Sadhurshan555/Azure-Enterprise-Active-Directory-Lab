#===============================================================================
# Azure Enterprise AD Lab
# Script: 01-install_roles.ps1
# Purpose: Install Windows Server Roles
#===============================================================================

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
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "Installing Windows Server Roles"
Write-Host "=============================================" -ForegroundColor Cyan

$Roles = @(
    "AD-Domain-Services",
    "DNS",
    "DHCP"
)

foreach ($Role in $Roles)
{
    $Feature = Get-WindowsFeature -Name $Role

    if ($Feature.Installed)
    {
        Write-Host "$Role is already installed." -ForegroundColor Yellow
    }
    else
    {
        Write-Host "Installing $Role..." -ForegroundColor Green

        Install-WindowsFeature `
            -Name $Role `
            -IncludeManagementTools
    }
}

Write-Host ""
Write-Host "Installed Features" -ForegroundColor Cyan

Get-WindowsFeature AD-Domain-Services,DNS,DHCP |
Format-Table DisplayName,InstallState -AutoSize

Stop-Transcript

Write-Host ""
Write-Host "Restarting server..." -ForegroundColor Yellow

Restart-Computer -Force