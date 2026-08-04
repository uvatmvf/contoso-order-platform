variable "log_analytics_name" {
  description = "Name of the Log Analytics workspace."
  type        = string
}

variable "application_insights_name" {
  description = "Name of the Application Insights component."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing monitoring resources."
  type        = string
}

variable "location" {
  description = "Azure region for monitoring resources."
  type        = string
}

variable "retention_in_days" {
  description = "Log Analytics retention period."
  type        = number
  default     = 30
}

variable "daily_data_cap_in_gb" {
  description = "Application Insights daily ingestion cap."
  type        = number
  default     = 1
}

variable "sampling_percentage" {
  description = "Percentage of Application Insights telemetry retained."
  type        = number
  default     = 100
}

variable "tags" {
  description = "Tags applied to monitoring resources."
  type        = map(string)
  default     = {}
}