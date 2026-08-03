output "id" {
  description = "Resource ID of the Storage account."
  value       = azurerm_storage_account.this.id
}

output "name" {
  description = "Name of the Storage account."
  value       = azurerm_storage_account.this.name
}

output "primary_blob_endpoint" {
  description = "Primary Blob service endpoint."
  value       = azurerm_storage_account.this.primary_blob_endpoint
}

output "primary_table_endpoint" {
  description = "Primary Table service endpoint."
  value       = azurerm_storage_account.this.primary_table_endpoint
}