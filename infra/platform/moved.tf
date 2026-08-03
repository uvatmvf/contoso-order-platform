moved {
  from = azurerm_servicebus_namespace.integration
  to   = module.servicebus.azurerm_servicebus_namespace.this
}

moved {
  from = azurerm_servicebus_queue.integration["place_order"]
  to   = module.servicebus.azurerm_servicebus_queue.this["place_order"]
}

moved {
  from = azurerm_servicebus_queue.integration["reserve_inventory"]
  to   = module.servicebus.azurerm_servicebus_queue.this["reserve_inventory"]
}

moved {
  from = azurerm_servicebus_topic.integration
  to   = module.servicebus.azurerm_servicebus_topic.order_events
}

moved {
  from = azurerm_servicebus_subscription.integration["authorize_payment"]
  to   = module.servicebus.azurerm_servicebus_subscription.this["authorize_payment"]
}

moved {
  from = azurerm_servicebus_subscription.integration["complete_order"]
  to   = module.servicebus.azurerm_servicebus_subscription.this["complete_order"]
}

moved {
  from = azurerm_storage_account.integration
  to   = module.storage.azurerm_storage_account.this
}