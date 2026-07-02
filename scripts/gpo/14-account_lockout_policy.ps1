<#
===============================================================================
Azure Enterprise AD Lab
Script : 14-account_lockout_policy.ps1
Purpose: Configure Account Lockout Policy
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "14-account_lockout_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host ""
Write-Host "==============================================="
Write-Host "Configuring Account Lockout Policy"
Write-Host "==============================================="

net accounts `
/lockoutthreshold:5 `
/lockoutduration:15 `
/lockoutwindow:15

Write-Host ""

Write-Host "Current Account Lockout Policy"

net accounts

Stop-Transcript