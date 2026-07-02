<#
===============================================================================
Azure Enterprise AD Lab
Script : 12-create_gpos.ps1
Purpose: Create Enterprise Group Policy Objects
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

$LogFile = Join-Path $LogFolder "12-create_gpos.log"

Start-Transcript -Path $LogFile -Append

$DomainDN = (Get-ADDomain).DistinguishedName

$Policies = @(
    "Password Policy",
    "Account Lockout Policy",
    "Windows Firewall",
    "Windows Update",
    "Desktop Wallpaper",
    "USB Storage",
    "Drive Mapping"
)

foreach ($Policy in $Policies)
{
    if (!(Get-GPO -Name $Policy -ErrorAction SilentlyContinue))
    {
        New-GPO -Name $Policy | Out-Null

        New-GPLink `
            -Name $Policy `
            -Target $DomainDN `
            -Enforced No

        Write-Host "$Policy created." -ForegroundColor Green
    }
    else
    {
        Write-Host "$Policy already exists." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Current Group Policies"
Write-Host "----------------------"

Get-GPO -All |
Sort DisplayName |
Select DisplayName

Stop-Transcript