output "id" {
  description = "Resource ID of the Function App."
  value       = azurerm_windows_function_app.this.id
}

output "name" {
  description = "Name of the Function App."
  value       = azurerm_windows_function_app.this.name
}

output "default_hostname" {
  description = "Default hostname of the Function App."
  value       = azurerm_windows_function_app.this.default_hostname
}

output "principal_id" {
  description = "Principal ID of the system-assigned managed identity."
  value       = azurerm_windows_function_app.this.identity[0].principal_id
}

output "service_plan_id" {
  description = "Resource ID of the Function App service plan."
  value       = azurerm_service_plan.this.id
}

output "host_storage_account_id" {
  description = "Resource ID of the Functions host storage account."
  value       = azurerm_storage_account.host.id
}