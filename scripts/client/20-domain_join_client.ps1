<#
===============================================================================
Azure Enterprise AD Lab
Script : 20-domain_join_client.ps1
Purpose: Join Client to Active Directory Domain
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

$Credential = Get-Credential

Write-Host "Joining $DomainName..."

Add-Computer `
    -DomainName $DomainName `
    -Credential $Credential `
    -Restart `
    -Force