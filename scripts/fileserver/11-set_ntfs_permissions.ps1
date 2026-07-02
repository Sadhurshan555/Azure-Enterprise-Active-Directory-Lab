<#
===============================================================================
Azure Enterprise AD Lab
Script : 11-set_ntfs_permissions.ps1
Purpose: Configure NTFS Permissions
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module ActiveDirectory

# Logging
if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "11-set_ntfs_permissions.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

Write-Host ""
Write-Host "========================================="
Write-Host "Configuring NTFS Permissions"
Write-Host "========================================="

$Permissions = @(
    @{Folder="IT";        Group="GG_IT_Users"}
    @{Folder="HR";        Group="GG_HR_Users"}
    @{Folder="Finance";   Group="GG_Finance_Users"}
    @{Folder="Sales";     Group="GG_Sales_Users"}
    @{Folder="Public";    Group="Domain Users"}
)

foreach ($Item in $Permissions)
{
    $FolderPath = Join-Path $ShareRoot $Item.Folder

    Write-Host "Configuring $($Item.Folder)..."

    # Disable inheritance but keep existing inherited permissions
    icacls $FolderPath /inheritance:d | Out-Null

    # Grant department group Modify permissions
    icacls $FolderPath /grant "$($Item.Group):(OI)(CI)M" | Out-Null

    # Ensure Administrators have Full Control
    icacls $FolderPath /grant "Administrators:(OI)(CI)F" | Out-Null

    # Ensure SYSTEM has Full Control
    icacls $FolderPath /grant "SYSTEM:(OI)(CI)F" | Out-Null

    Write-Host "$($Item.Folder) configured." -ForegroundColor Green
}

Write-Host ""
Write-Host "NTFS permissions configured successfully." -ForegroundColor Green

Stop-Transcript