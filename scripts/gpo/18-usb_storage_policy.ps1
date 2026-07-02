<#
===============================================================================
Azure Enterprise AD Lab
Script : 18-usb_storage_policy.ps1
Purpose: Disable USB Storage
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "18-usb_storage_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host "Disabling USB Storage..."

Set-ItemProperty `
-Path "HKLM:\SYSTEM\CurrentControlSet\Services\USBSTOR" `
-Name Start `
-Value 4

Write-Host "USB Storage disabled."

Stop-Transcript