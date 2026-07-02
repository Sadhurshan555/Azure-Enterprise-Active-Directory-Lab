<#
===============================================================================
Azure Enterprise AD Lab
Script : 21-health_check.ps1
Purpose: Enterprise Health Check
===============================================================================
#>

. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module ActiveDirectory

Write-Host ""
Write-Host "======================================"
Write-Host "Azure Enterprise AD Lab Health Check"
Write-Host "======================================"
Write-Host ""

Write-Host "Server Name:"
hostname

Write-Host ""
Write-Host "Domain:"
(Get-ADDomain).DNSRoot

Write-Host ""
Write-Host "Installed Roles"

Get-WindowsFeature AD-Domain-Services,DNS,DHCP |
Format-Table DisplayName,InstallState

Write-Host ""
Write-Host "DNS Zones"

Get-DnsServerZone |
Select ZoneName

Write-Host ""
Write-Host "DHCP Scopes"

Get-DhcpServerv4Scope

Write-Host ""
Write-Host "Organizational Units"

Get-ADOrganizationalUnit -Filter * |
Select Name

Write-Host ""
Write-Host "Users"

Get-ADUser -Filter * |
Measure-Object

Write-Host ""
Write-Host "Groups"

Get-ADGroup -Filter * |
Measure-Object

Write-Host ""
Write-Host "Shares"

Get-SmbShare |
Where Name -NotLike "*$"

Write-Host ""
Write-Host "Domain Controller"

dcdiag /q

Write-Host ""
Write-Host "Replication"

repadmin /replsummary