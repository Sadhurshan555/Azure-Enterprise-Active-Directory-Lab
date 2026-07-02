# Azure Enterprise Active Directory Lab

## Overview
Azure Enterprise Active Directory Lab is an Infrastructure as Code (IaC) and Windows Server automation project that demonstrates the deployment and configuration of a complete enterprise Active Directory environment in Microsoft Azure.

The project uses Terraform to provision Azure infrastructure and PowerShell to automate Windows Server administration tasks, including Active Directory Domain Services (AD DS), DNS, DHCP, Group Policy, file services, and client domain integration.

The objective is to simulate a real-world enterprise environment while following infrastructure automation and Windows Server administration best practices.


## Objectives
- Automate Azure infrastructure deployment using Terraform.
- Configure Active Directory Domain Services.
- Deploy and configure DNS and DHCP services.
- Automate Active Directory user and group management.
- Configure SMB file shares and NTFS permissions.
- Implement Group Policy Objects (GPOs).
- Join Windows 11 clients to the Active Directory domain.
- Perform automated health checks and reporting.

## Technologies
- Microsoft Azure
- Terraform
- Windows Server 2022
- Windows 11 Enterprise
- Active Directory Domain Services
- DNS Server
- DHCP Server
- PowerShell
- SMB File Sharing
- NTFS Permissions
- Group Policy
- Git
- GitHub

## High-Level Architecture

                                 Internet
                                     │
                                     ▼
                            Microsoft Azure
                                     │
                                     ▼
                            Resource Groups
                                     │
                                     ▼
                            Virtual Network
                            (10.0.0.0/16)
                                     │
                 ┌───────────────────┴───────────────────┐
                 │                                       │
                 ▼                                       ▼
        Server Subnet                           Client Subnet
         (10.0.1.0/24)                          (10.0.2.0/24)
                 │                                       │
                 ▼                                       ▼
      Windows Server 2022                    Windows 11 Enterprise
                 │                                       │
                 │                                       │
      ┌──────────┴──────────┐                            │
      │                     │                            │
      ├─ Active Directory   │                            │
      ├─ DNS Server         │                            │
      ├─ DHCP Server        │───────────────┐            │
      ├─ File Server        │               │            │
      └─ Group Policy       │               │            │
                             └──────────────► Domain Joined


## Key Features
- Infrastructure deployment using Terraform
- Automated Windows Server configuration
- Active Directory Domain Services deployment
- DNS and DHCP configuration
- Enterprise Organizational Unit (OU) structure
- Automated user provisioning
- Security group management
- SMB file share creation
- NTFS permission configuration
- Group Policy implementation
- Windows 11 domain join automation
- Environment validation and health reporting

## Folder Structure

Azure-Enterprise-Active-Directory-Lab
│
├── terraform
│   ├── providers.tf
│   ├── variables.tf
│   ├── terraform.tfvars.example
│   ├── resource_groups.tf
│   ├── networking.tf
│   ├── nsg.tf
│   ├── server_vm.tf
│   ├── client_vm.tf
│   ├── extensions.tf
│   ├── outputs.tf
│   ├── README.md
│   └── .gitignore
│
├── scripts
│   ├── config
│   │   └── lab-config.ps1
│   │
│   ├── install
│   │   └── 01-install_roles.ps1
│   │
│   ├── adds
│   │   └── 02-promote_domain_controller.ps1
│   │
│   ├── dns
│   │   ├── 03-configure_dns.ps1
│   │   └── 04-create_dns_records.ps1
│   │
│   ├── dhcp
│   │   └── 05-configure_dhcp.ps1
│   │
│   ├── users
│   │   ├── 06-create_ous.ps1
│   │   └── 07-create_users.ps1
│   │
│   ├── groups
│   │   ├── 08-create_security_groups.ps1
│   │   └── 09-add_users_to_groups.ps1
│   │
│   ├── fileserver
│   │   ├── 10-create_file_shares.ps1
│   │   └── 11-set_ntfs_permissions.ps1
│   │
│   ├── gpo
│   │   ├── 12-create_gpos.ps1
│   │   ├── 13-password_policy.ps1
│   │   ├── 14-account_lockout_policy.ps1
│   │   ├── 15-firewall_policy.ps1
│   │   ├── 16-windows_update_policy.ps1
│   │   ├── 17-desktop_wallpaper.ps1
│   │   ├── 18-usb_storage_policy.ps1
│   │   └── 19-drive_mapping_policy.ps1
│   │
│   ├── client
│   │   └── 20-domain_join_client.ps1
│   │
│   └── health
│       ├── 21-health_check.ps1
│       └── 22-generate_lab_report.ps1
│
├── diagrams
│   ├── High-Level-Architecture.drawio
│   └── Detailed-Architecture.drawio
│
├── docs
│   ├── 01-Architecture.md
│   ├── 02-Deployment-Guide.md
│   ├── 03-Terraform.md
│   ├── 04-Active-Directory.md
│   ├── 05-DNS.md
│   ├── 06-DHCP.md
│   ├── 07-Group-Policy.md
│   ├── 08-File-Server.md
│   ├── 09-Client-Domain-Join.md
│   ├── 10-Health-Checks.md
│   ├── 11-Troubleshooting.md
│   └── 12-Future-Improvements.md
│
├── screenshots
│   ├── terraform
│   ├── azure
│   ├── adds
│   ├── dns
│   ├── dhcp
│   ├── users
│   ├── groups
│   ├── gpo
│   ├── fileserver
│   ├── client
│   └── health
│
├── Important Configuration Required.md
└── README.md

## Skills Demonstrated
- Infrastructure as Code (Terraform)
- Microsoft Azure Administration
- Windows Server Administration
- Active Directory Domain Services
- DNS Administration
- DHCP Administration
- PowerShell Automation
- Active Directory User and Group Management
- Organizational Unit Design
- SMB File Services
- NTFS Permission Management
- Group Policy Administration
- Domain Join Configuration
- Enterprise Infrastructure Documentation


## Future Enhancements
- Azure Bastion
- Windows Admin Center
- Azure Backup
- Azure Monitor
- Active Directory Certificate Services (AD CS)
- DFS Namespace and DFS Replication
- WSUS
- Azure AD Connect
- Hybrid Identity
- IIS Web Server
- Microsoft Entra ID Integration

## Documentation
Detailed documentation is available in the `/docs` directory and includes:
- Architecture
- Deployment Guide
- Terraform Configuration
- Active Directory Configuration
- DNS
- DHCP
- Group Policy
- Troubleshooting


## Deployment
```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```
