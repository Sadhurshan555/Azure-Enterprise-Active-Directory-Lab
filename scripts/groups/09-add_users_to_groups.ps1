<#
===============================================================================
Azure Enterprise AD Lab
Script : 09-add_users_to_groups.ps1
Purpose: Add Users to Security Groups
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module ActiveDirectory

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "09-add_users_to_groups.log"

Start-Transcript -Path $LogFile -Append

$Departments = @(
    "IT",
    "HR",
    "Finance",
    "Sales",
    "Management"
)

foreach ($Department in $Departments)
{
    $Group = switch ($Department)
    {
        "IT"         { "GG_IT_Users" }
        "HR"         { "GG_HR_Users" }
        "Finance"    { "GG_Finance_Users" }
        "Sales"      { "GG_Sales_Users" }
        "Management" { "GG_Management" }
    }

    $Users = Get-ADUser -Filter "Department -eq '$Department'"

    foreach ($User in $Users)
    {
        Add-ADGroupMember `
            -Identity $Group `
            -Members $User `
            -ErrorAction SilentlyContinue

        Write-Host "$($User.SamAccountName) added to $Group"
    }
}

Write-Host ""
Write-Host "Completed."

Stop-Transcript