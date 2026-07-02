<#
===============================================================================
Azure Enterprise AD Lab
Script : 17-desktop_wallpaper.ps1
Purpose: Configure Desktop Wallpaper Policy
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "17-desktop_wallpaper.log"

Start-Transcript -Path $LogFile -Append

Write-Host "Wallpaper policy placeholder."

Write-Host "In production, configure:"
Write-Host "User Configuration"
Write-Host " -> Administrative Templates"
Write-Host " -> Desktop"
Write-Host " -> Desktop Wallpaper"

Stop-Transcript