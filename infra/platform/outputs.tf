output "storage_account_name" {
  description = "Name of the integration platform Storage account."
  value       = module.storage.name
}

output "storage_account_id" {
  description = "Azure resource ID of the integration platform Storage account."
  value       = module.storage.id
}

output "servicebus_namespace_name" {
  description = "Name of the integration platform Service Bus namespace."
  value       = module.servicebus.namespace_name
}

output "servicebus_namespace_id" {
  description = "Azure resource ID of the Service Bus namespace."
  value       = module.servicebus.namespace_id
}