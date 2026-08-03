variable "name" {
  description = "Name of the Azure Storage account."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Storage account."
  type        = string
}

variable "location" {
  description = "Azure region for the Storage account."
  type        = string
}

variable "account_tier" {
  description = "Performance tier for the Storage account."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type for the Storage account."
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Kind of Azure Storage account."
  type        = string
  default     = "StorageV2"
}

variable "min_tls_version" {
  description = "Minimum TLS version accepted by the Storage account."
  type        = string
  default     = "TLS1_2"
}

variable "allow_nested_items_to_be_public" {
  description = "Whether nested blobs or containers may be configured for public access."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags applied to the Storage account."
  type        = map(string)
  default     = {}
}