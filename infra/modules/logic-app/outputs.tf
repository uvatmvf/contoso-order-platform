output "id" {
  description = "Azure resource ID of the Logic App."
  value       = azurerm_logic_app_workflow.this.id
}

output "name" {
  description = "Name of the Logic App."
  value       = azurerm_logic_app_workflow.this.name
}

output "principal_id" {
  description = "Principal ID of the Logic App system-assigned identity."
  value       = azurerm_logic_app_workflow.this.identity[0].principal_id
}

output "callback_url" {
  description = "HTTP request trigger callback URL."
  value       = azurerm_logic_app_trigger_http_request.place_order.callback_url
  sensitive   = true
}