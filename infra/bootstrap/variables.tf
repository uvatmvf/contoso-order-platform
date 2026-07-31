variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "location" {
  description = "Azure region for the Terraform state resources."
  type        = string
}

variable "state_storage_account_name" {
  description = "Globally unique storage account name used for Terraform state."
  type        = string

  validation {
    condition = (
      length(var.state_storage_account_name) >= 3 &&
      length(var.state_storage_account_name) <= 24 &&
      can(regex("^[a-z0-9]+$", var.state_storage_account_name))
    )

    error_message = "The storage account name must contain 3-24 lowercase letters and numbers only."
  }
}
