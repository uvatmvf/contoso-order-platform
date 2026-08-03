variable "name" {
  description = "Name of the Windows Function App."
  type        = string
}

variable "service_plan_name" {
  description = "Name of the Function App service plan."
  type        = string
}

variable "host_storage_account_name" {
  description = "Name of the storage account used by the Functions runtime."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Function App resources."
  type        = string
}

variable "location" {
  description = "Azure region for the Function App resources."
  type        = string
}

variable "service_plan_sku" {
  description = "SKU for the Function App service plan."
  type        = string
  default     = "Y1"
}

variable "dotnet_version" {
  description = "Version of .NET used by the isolated Functions worker."
  type        = string
  default     = "v10.0"
}

variable "app_settings" {
  description = "Additional Function App settings."
  type        = map(string)
  default     = {}
}

variable "tags" {
  description = "Tags applied to the Function App resources."
  type        = map(string)
  default     = {}
}