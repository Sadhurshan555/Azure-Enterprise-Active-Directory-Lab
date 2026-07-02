<#
===============================================================================
Azure Enterprise AD Lab
Script : 06-create_ous.ps1
Purpose: Create Organizational Units
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "06-create_ous.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "Creating Organizational Units" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

$DomainDN = (Get-ADDomain).DistinguishedName

$OUs = @(
    "IT",
    "HR",
    "Finance",
    "Sales",
    "Management",
    "Servers",
    "Workstations",
    "Groups"
)

foreach ($OU in $OUs)
{
    $ExistingOU = Get-ADOrganizationalUnit `
        -LDAPFilter "(ou=$OU)" `
        -SearchBase $DomainDN `
        -ErrorAction SilentlyContinue

    if ($ExistingOU)
    {
        Write-Host "$OU already exists." -ForegroundColor Yellow
    }
    else
    {
        New-ADOrganizationalUnit `
            -Name $OU `
            -Path $DomainDN `
            -ProtectedFromAccidentalDeletion $true

        Write-Host "$OU created." -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "Current Organizational Units"
Write-Host "----------------------------"

Get-ADOrganizationalUnit `
    -Filter * `
    -SearchBase $DomainDN |
Sort-Object Name |
Select-Object Name

Stop-Transcript