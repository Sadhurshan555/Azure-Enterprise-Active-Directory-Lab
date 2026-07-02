# Azure Enterprise AD Lab using Terraform

## Overview

This project deploys an enterprise-style Azure lab consisting of:

- Windows Server 2022 Azure Edition
- Windows 11 Pro 24H2
- Separate Resource Groups
- Shared Virtual Network
- Separate Subnets
- NSGs
- Static Private IPs
- Public IPs
- RDP restricted to a single public IP
- Trusted Launch
- Secure Boot
- vTPM

---

## Resources Created

- RG-Server
- RG-Client

### Network

- Corp-VNet
- Server-Subnet
- Client-Subnet

### Virtual Machines

- Server2022
- Win11Client

---

## Deployment

```bash
terraform init

terraform fmt

terraform validate

terraform plan

terraform apply
```