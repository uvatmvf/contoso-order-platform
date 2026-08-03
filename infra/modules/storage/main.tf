resource "azurerm_storage_account" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  account_kind             = var.account_kind

  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = var.allow_nested_items_to_be_public

  tags = var.tags
}

variable "tables" {
  description = "Storage tables to create."
  type        = set(string)
  default     = []
}

resource "azurerm_storage_table" "this" {
  for_each = var.tables

  name               = each.value
  storage_account_id = azurerm_storage_account.this.id
}