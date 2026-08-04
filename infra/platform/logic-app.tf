module "logic_app" {
  source = "../modules/logic-app"

  name                = local.names.logic_app
  resource_group_name = azurerm_resource_group.integration.name
  location            = azurerm_resource_group.integration.location

  service_bus_namespace = module.servicebus.fully_qualified_namespace

  queue_name = "place-order"

  tags = local.common_tags
}