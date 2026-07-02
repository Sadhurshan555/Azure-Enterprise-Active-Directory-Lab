<#
===============================================================================
Azure Enterprise AD Lab
Script : 19-drive_mapping_policy.ps1
Purpose: Drive Mapping Placeholder
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder -Force | Out-Null
}

$LogFile = Join-Path $LogFolder "19-drive_mapping_policy.log"

Start-Transcript -Path $LogFile -Append

Write-Host ""
Write-Host "Example Drive Mappings"
Write-Host ""
Write-Host "IT        -> \\Server2022\IT"
Write-Host "HR        -> \\Server2022\HR"
Write-Host "Finance   -> \\Server2022\Finance"
Write-Host "Sales     -> \\Server2022\Sales"
Write-Host "Public    -> \\Server2022\Public"

Stop-Transcript