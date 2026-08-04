output "log_analytics_workspace_id" {
  description = "Azure resource ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.id
}

output "log_analytics_workspace_name" {
  description = "Name of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.this.name
}

output "application_insights_id" {
  description = "Azure resource ID of Application Insights."
  value       = azurerm_application_insights.this.id
}

output "application_insights_name" {
  description = "Name of Application Insights."
  value       = azurerm_application_insights.this.name
}

output "application_insights_connection_string" {
  description = "Connection string used to send application telemetry."
  value       = azurerm_application_insights.this.connection_string
  sensitive   = true
}