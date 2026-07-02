<#
===============================================================================
Azure Enterprise AD Lab
Script : 16-windows_update_policy.ps1
Purpose: Configure Windows Update
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "16-windows_update_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host "Configuring Windows Update..."

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Force | Out-Null
New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Force | Out-Null

Set-ItemProperty `
-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" `
-Name AUOptions `
-Value 4 `
-Type DWord

Write-Host "Automatic Updates configured."

Stop-Transcript