<#
===============================================================================
Azure Enterprise AD Lab
Script : 22-generate_lab_report.ps1
Purpose: Generate Lab Report
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

$Report = "C:\Logs\LabReport.txt"

Start-Transcript -Path $Report

Write-Host "Azure Enterprise AD Lab Report"
Write-Host "Generated: $(Get-Date)"

Write-Host ""
Write-Host "================================"

Write-Host ""
Write-Host "Domain"
(Get-ADDomain).DNSRoot

Write-Host ""
Write-Host "Forest"
(Get-ADForest).Name

Write-Host ""
Write-Host "Users"
(Get-ADUser -Filter *).Count

Write-Host ""
Write-Host "Groups"
(Get-ADGroup -Filter *).Count

Write-Host ""
Write-Host "OUs"
(Get-ADOrganizationalUnit -Filter *).Count

Write-Host ""
Write-Host "Shares"

Get-SmbShare |
Where Name -NotLike "*$"

Write-Host ""
Write-Host "DNS Zones"

Get-DnsServerZone

Write-Host ""
Write-Host "DHCP"

Get-DhcpServerv4Scope

Write-Host ""
Write-Host "Health"

dcdiag /q

Stop-Transcript

Write-Host ""
Write-Host "Report saved to:"
Write-Host $Report