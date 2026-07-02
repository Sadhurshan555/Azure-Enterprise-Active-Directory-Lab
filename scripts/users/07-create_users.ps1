<#
===============================================================================
Azure Enterprise AD Lab
Script : 07-create_users.ps1
Purpose: Create Enterprise Users
===============================================================================
#>

# Import Configuration
. "$PSScriptRoot\..\config\lab-config.ps1"

Import-Module ActiveDirectory

if (!(Test-Path $LogFolder))
{
    New-Item -ItemType Directory -Path $LogFolder | Out-Null
}

$LogFile = Join-Path $LogFolder "07-create_users.log"

Start-Transcript -Path $LogFile -Append

$Password = ConvertTo-SecureString "P@ssw0rd123!" -AsPlainText -Force

$Users = @(

@{First="John";Last="Smith";Department="IT";Username="jsmith"}

@{First="David";Last="Wilson";Department="IT";Username="dwilson"}

@{First="James";Last="Taylor";Department="IT";Username="jtaylor"}

@{First="Daniel";Last="Thomas";Department="IT";Username="dthomas"}

@{First="Michael";Last="Brown";Department="IT";Username="mbrown"}

@{First="Sarah";Last="Johnson";Department="HR";Username="sjohnson"}

@{First="Emily";Last="Davis";Department="HR";Username="edavis"}

@{First="Sophia";Last="Martin";Department="HR";Username="smartin"}

@{First="Olivia";Last="Moore";Department="Finance";Username="omoore"}

@{First="Jessica";Last="White";Department="Finance";Username="jwhite"}

@{First="Emma";Last="Clark";Department="Finance";Username="eclark"}

@{First="William";Last="Hall";Department="Sales";Username="whall"}

@{First="Noah";Last="Allen";Department="Sales";Username="nallen"}

@{First="Liam";Last="King";Department="Sales";Username="lking"}

@{First="Lucas";Last="Scott";Department="Sales";Username="lscott"}

@{First="Mason";Last="Green";Department="Sales";Username="mgreen"}

@{First="Robert";Last="Walker";Department="Management";Username="rwalker"}

@{First="Jennifer";Last="Young";Department="Management";Username="jyoung"}

)

foreach ($User in $Users)
{

$OU = "OU=$($User.Department)," + (Get-ADDomain).DistinguishedName

if (!(Get-ADUser -Filter "SamAccountName -eq '$($User.Username)'" -ErrorAction SilentlyContinue))
{

New-ADUser `
-Name "$($User.First) $($User.Last)" `
-GivenName $User.First `
-Surname $User.Last `
-DisplayName "$($User.First) $($User.Last)" `
-SamAccountName $User.Username `
-UserPrincipalName "$($User.Username)@$DomainName" `
-Department $User.Department `
-Path $OU `
-Enabled $true `
-ChangePasswordAtLogon $true `
-AccountPassword $Password

Write-Host "$($User.Username) created."

}
else
{
Write-Host "$($User.Username) already exists."
}

}

Stop-Transcript