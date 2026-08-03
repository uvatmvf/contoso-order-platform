output "namespace_id" {
  description = "Resource ID of the Service Bus namespace."
  value       = azurerm_servicebus_namespace.this.id
}

output "namespace_name" {
  description = "Name of the Service Bus namespace."
  value       = azurerm_servicebus_namespace.this.name
}

output "queue_ids" {
  description = "Map of queue resource IDs."
  value = {
    for key, queue in azurerm_servicebus_queue.this :
    key => queue.id
  }
}

output "topic_id" {
  description = "Resource ID of the order-events topic."
  value       = azurerm_servicebus_topic.order_events.id
}

output "subscription_ids" {
  description = "Map of subscription resource IDs."
  value = {
    for key, subscription in azurerm_servicebus_subscription.this :
    key => subscription.id
  }
}

output "fully_qualified_namespace" {
  description = "Fully qualified Service Bus namespace hostname."
  value       = "${azurerm_servicebus_namespace.this.name}.servicebus.windows.net"
}