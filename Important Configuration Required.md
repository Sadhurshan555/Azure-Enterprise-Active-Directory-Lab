> [!IMPORTANT]
> ## Configuration Required Before Deployment
>
> Before running `terraform apply`, you **must** update the following configuration files with your own Azure subscription details, domain information, and administrator credentials.

---

## 1. Update Terraform Variables

**File**

```text
terraform/terraform.tfvars
```

Replace the placeholder values below:

```hcl
####################################
# Azure
####################################

subscription_id = "Your Azure Subscription ID"

####################################
# Credentials
####################################

admin_username = "Administrator"

admin_password = "AdminPass@32145"
```

---

## 2. Update Active Directory Configuration

**File**

```text
scripts/config/lab-config.ps1
```

Replace the placeholder values below:

```powershell
#=============================
# Domain Information
#=============================

$DomainName = "yourdomain.com"

$NetBIOSName = "YOURDOMAIN"

$SafeModePassword = "AdminPass@32145"
```

---

## 3. Recommended Values

| Setting | Example |
|---------|---------|
| Domain Name | `contoso.local` |
| NetBIOS Name | `CONTOSO` |
| Administrator Username | `Administrator` |
| Administrator Password | Your own secure password |
| Safe Mode Password | Same secure password |

---

## Security Notice

This repository uses **placeholder values** for demonstration purposes.

Before deploying to Azure:

- Replace all placeholder credentials.
- Never commit real passwords to GitHub.
- Do not upload `terraform.tfvars`, `.tfstate` files, or Azure credentials.
- Use your own Azure Subscription ID.