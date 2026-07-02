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
                            │
                 Microsoft Azure
                            │
                 Resource Groups
                            │
                    Virtual Network
                            │
          ┌─────────────────┴─────────────────┐
          │                                   │
     Server Subnet                      Client Subnet
          │                                   │
   Windows Server 2022                 Windows 11 Client
          │                                   │
          │                                   │
  ┌─────────────────────┐             Domain Joined
  │                     │
  │ Active Directory
  │ DNS
  │ DHCP
  │ File Server
  │ Group Policy
  └─────────────────────┘

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
Azure-Enterprise-AD-Lab
│
├── terraform
├── scripts
│   ├── config
│   ├── install
│   ├── adds
│   ├── dns
│   ├── dhcp
│   ├── users
│   ├── groups
│   ├── fileserver
│   ├── gpo
│   ├── client
│   └── health
│
├── diagrams
├── docs
├── screenshots
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