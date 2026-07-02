<#
===============================================================================
Azure Enterprise AD Lab
Script : 10-create_file_shares.ps1
Purpose: Create SMB Shares
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module SmbShare

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "10-create_file_shares.log"

Start-Transcript -Path $LogFile -Append

$ErrorActionPreference = "Stop"

# Create Share Root

if (!(Test-Path $ShareRoot))
{
    New-Item -Path $ShareRoot -ItemType Directory | Out-Null

    Write-Host "Created $ShareRoot"
}

$Shares = @(
    "IT",
    "HR",
    "Finance",
    "Sales",
    "Public"
)

foreach ($Share in $Shares)
{
    $Folder = Join-Path $ShareRoot $Share

    if (!(Test-Path $Folder))
    {
        New-Item -Path $Folder -ItemType Directory | Out-Null
    }

    if (!(Get-SmbShare -Name $Share -ErrorAction SilentlyContinue))
    {
        New-SmbShare `
            -Name $Share `
            -Path $Folder `
            -FullAccess "Administrators"

        Write-Host "$Share share created." -ForegroundColor Green
    }
    else
    {
        Write-Host "$Share already exists." -ForegroundColor Yellow
    }
}

Write-Host ""
Write-Host "Current SMB Shares"
Write-Host "------------------"

Get-SmbShare |
Where-Object Name -in $Shares |
Select-Object Name,Path

Stop-Transcript