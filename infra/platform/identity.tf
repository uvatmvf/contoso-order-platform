resource "azurerm_role_assignment" "function_servicebus_receiver" {
  scope                = module.servicebus.namespace_id
  role_definition_name = "Azure Service Bus Data Receiver"
  principal_id         = module.function_app.principal_id
}

resource "azurerm_role_assignment" "function_servicebus_sender" {
  scope                = module.servicebus.namespace_id
  role_definition_name = "Azure Service Bus Data Sender"
  principal_id         = module.function_app.principal_id
}

resource "azurerm_role_assignment" "function_storage_table_contributor" {
  scope                = module.storage.id
  role_definition_name = "Storage Table Data Contributor"
  principal_id         = module.function_app.principal_id
}