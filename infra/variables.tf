variable "environment" {
  description = "Deployment environment name."
  type        = string

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be dev, stage, or prod."
  }
}

variable "location" {
  description = "Azure region for deployed resources."
  type        = string
}