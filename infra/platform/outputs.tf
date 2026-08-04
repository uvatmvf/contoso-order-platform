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

output "function_app_name" {
  description = "Name of the order-processing Function App."
  value       = module.function_app.name
}

output "function_app_hostname" {
  description = "Default hostname of the order-processing Function App."
  value       = module.function_app.default_hostname
}

output "function_app_principal_id" {
  description = "Principal ID of the Function App managed identity."
  value       = module.function_app.principal_id
}

output "log_analytics_workspace_name" {
  description = "Name of the platform Log Analytics workspace."
  value       = module.monitoring.log_analytics_workspace_name
}

output "application_insights_name" {
  description = "Name of the platform Application Insights component."
  value       = module.monitoring.application_insights_name
}

output "logic_app_name" {
  description = "Name of the stage place-order Logic App."
  value       = module.logic_app.name
}

output "logic_app_callback_url" {
  description = "HTTP endpoint for submitting place-order requests."
  value       = module.logic_app.callback_url
  sensitive   = true
}