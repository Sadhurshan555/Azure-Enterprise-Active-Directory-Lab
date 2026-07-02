<#
===============================================================================
Azure Enterprise AD Lab
Script : 08-create_security_groups.ps1
Purpose: Create Enterprise Security Groups
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module ActiveDirectory

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "08-create_security_groups.log"

Start-Transcript -Path $LogFile -Append

$DomainDN = (Get-ADDomain).DistinguishedName

$GroupsOU = "OU=Groups,$DomainDN"

$Groups = @(
"GG_IT_Admins",
"GG_IT_Users",
"GG_HR_Admins",
"GG_HR_Users",
"GG_Finance_Admins",
"GG_Finance_Users",
"GG_Sales_Admins",
"GG_Sales_Users",
"GG_Management"
)

foreach ($Group in $Groups)
{
    if (!(Get-ADGroup -Filter "Name -eq '$Group'" -ErrorAction SilentlyContinue))
    {
        New-ADGroup `
            -Name $Group `
            -SamAccountName $Group `
            -GroupScope Global `
            -GroupCategory Security `
            -Path $GroupsOU

        Write-Host "$Group created." -ForegroundColor Green
    }
    else
    {
        Write-Host "$Group already exists." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Current Security Groups"
Write-Host "-----------------------"

Get-ADGroup `
    -SearchBase $GroupsOU `
    -Filter * |
Sort Name |
Select Name

Stop-Transcript