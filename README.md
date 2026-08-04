# Description


**Purpose**

This repository was built as a hands-on reference implementation of a modern Azure integration platform. The goal was not simply to provision Azure resources, but to demonstrate production-oriented engineering practices including infrastructure as code, modular Terraform design, passwordless authentication with Managed Identity, least-privilege RBAC, GitHub Actions with OIDC federation, and environment promotion.

---

# README.md

```text
# Contoso Order Platform Infrastructure

Infrastructure as Code (IaC) for the Contoso Order Platform.

This repository provisions the Azure infrastructure used by the Contoso Integration application using Terraform.

The platform demonstrates production-oriented Azure infrastructure practices including:

- Azure Functions
- Azure Service Bus
- Azure Storage
- Managed Identity
- Azure RBAC
- Remote Terraform State
- Modular Terraform Design
- GitHub Actions
- Environment Promotion
```

---

# Goals

```text
## Goals

This project demonstrates modern Azure platform engineering practices.

Rather than provisioning resources manually through the Azure Portal, all infrastructure is described as code using Terraform.

Key architectural goals include:

- Immutable infrastructure
- Modular Terraform design
- Environment-specific configuration
- Remote state management
- Least-privilege security
- Passwordless authentication using Managed Identity
- Automated deployments through GitHub Actions
```

---

# Repository Structure

```text
infra/
│
├── bootstrap/
│   Creates the Terraform backend.
│
├── platform/
│   Deploys environment-specific infrastructure.
│
├── modules/
│   ├── function-app/
│   ├── servicebus/
│   └── storage/
│
└── environments/
    stage.tfvars
```

---

# Platform Architecture

```text
                        GitHub Actions
                              │
                              ▼
                     Terraform Apply
                              │
                              ▼
                    Azure Resource Group
                              │
      ┌───────────────────────┼────────────────────────┐
      ▼                       ▼                        ▼
 Storage Account        Service Bus             Function App
      │                     │                        │
      │                     │                        ▼
      │                     │               Managed Identity
      │                     │                        │
      └─────────────────────┴───────────────Azure RBAC
```

---

# Identity Model

```text
## Identity

The platform uses Managed Identity instead of connection strings.

Azure Functions authenticate using:

- System Assigned Managed Identity
- Azure RBAC
- DefaultAzureCredential()

No Service Bus connection strings are stored.

No Storage account keys are required.

No application secrets are required.
```

---

# Modules

```text
## Modules

Each Azure capability is encapsulated as a reusable Terraform module.

Current modules:

- Function App
- Storage
- Service Bus

Each module owns:

- resource creation
- defaults
- outputs

Environment-specific configuration remains in the platform layer.
```
---

# Environments

```text
Development

↓

Stage

↓

Production
```

Explain:

```text
The same Terraform modules are used for every environment.

Differences are supplied through:

- tfvars

- app settings

- naming conventions

- RBAC assignments
```

---

# CI/CD

```text
Pull Request

↓

terraform fmt

↓

terraform validate

↓

terraform plan

↓

Approval

↓

terraform apply
```

```text
Function Repository

↓

Build

↓

Test

↓

Publish

↓

Deploy
```
---

# Security

```text
## Security

The platform follows Zero Trust principles.

Authentication

• Managed Identity

Authorization

• Azure RBAC

Infrastructure

• Terraform Remote State

CI/CD

• GitHub OIDC Federation

Secrets

• None
```
---

# Future Improvements

```text
Roadmap

- Application Insights
<img width="1692" height="959" alt="image" src="https://github.com/user-attachments/assets/452a8818-b551-45c0-a516-57fc9b9f7145" />

- Log Analytics

- Diagnostic Settings

- Distributed Tracing

- Terraform Linting

- Policy as Code

- Production environment

- Private Networking

- Key Vault

- Azure Monitor Alerts
```
