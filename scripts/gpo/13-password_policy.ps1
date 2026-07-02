<#
===============================================================================
Azure Enterprise AD Lab
Script : 13-password_policy.ps1
Purpose: Configure Domain Password Policy
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module GroupPolicy
Import-Module ActiveDirectory

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "13-password_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host ""
Write-Host "Configuring Domain Password Policy..." -ForegroundColor Cyan

net accounts `
/minpwlen:8 `
/maxpwage:90 `
/minpwage:1 `
/uniquepw:24

Write-Host ""
Write-Host "Password policy configured successfully." -ForegroundColor Green

Write-Host ""
Write-Host "Current Password Policy"

net accounts

Stop-Transcript