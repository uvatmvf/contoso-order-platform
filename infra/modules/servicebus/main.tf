resource "azurerm_servicebus_namespace" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  tags = var.tags
}

resource "azurerm_servicebus_queue" "this" {
  for_each = var.queues

  name         = each.value.name
  namespace_id = azurerm_servicebus_namespace.this.id

  lock_duration                        = each.value.lock_duration
  max_delivery_count                   = each.value.max_delivery_count
  dead_lettering_on_message_expiration = each.value.dead_lettering_on_message_expiration
}

resource "azurerm_servicebus_topic" "order_events" {
  name         = var.topic_name
  namespace_id = azurerm_servicebus_namespace.this.id

  max_size_in_megabytes = 1024
}

resource "azurerm_servicebus_subscription" "this" {
  for_each = var.subscriptions

  name               = each.value.name
  topic_id           = azurerm_servicebus_topic.order_events.id
  max_delivery_count = each.value.max_delivery_count
}