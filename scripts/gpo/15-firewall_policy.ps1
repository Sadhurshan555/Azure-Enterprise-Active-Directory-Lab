<#
===============================================================================
Azure Enterprise AD Lab
Script : 15-firewall_policy.ps1
Purpose: Configure Windows Firewall
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "15-firewall_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host ""
Write-Host "Enabling Windows Firewall..."

Set-NetFirewallProfile `
-Profile Domain,Private,Public `
-Enabled True

Get-NetFirewallProfile |
Select Name,Enabled

Stop-Transcript