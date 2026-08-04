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

variable "name_overrides" {
  description = "Optional resource-name overrides for imported environments."

  type = object({
    resource_group        = optional(string)
    storage               = optional(string)
    service_bus           = optional(string)
    function_app          = optional(string)
    function_plan         = optional(string)
    function_host_storage = optional(string)
    logic_app             = optional(string)
    log_analytics         = optional(string)
    application_insights  = optional(string)
    key_vault             = optional(string)
    apim                  = optional(string)
  })

  default = {}
}