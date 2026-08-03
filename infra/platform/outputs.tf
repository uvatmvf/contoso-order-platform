output "storage_account_name" {
  description = "Name of the integration platform storage account."
  value       = azurerm_storage_account.integration.name
}

output "storage_account_id" {
  description = "Azure resource ID of the integration platform storage account."
  value       = azurerm_storage_account.integration.id
}

output "servicebus_namespace_name" {
  description = "Name of the integration platform Service Bus namespace."
  value       = module.servicebus.namespace_name
}

output "servicebus_namespace_id" {
  description = "Azure resource ID of the Service Bus namespace."
  value       = module.servicebus.namespace_id
}