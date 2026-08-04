module "function_app" {
  source = "../modules/function-app"

  name                      = local.names.function_app
  service_plan_name         = local.names.function_plan
  host_storage_account_name = local.names.function_host_storage

  resource_group_name = azurerm_resource_group.integration.name
  location            = azurerm_resource_group.integration.location

  service_plan_sku = "Y1"
  dotnet_version   = "v10.0"

  app_settings = {
    ServiceBusConnection__fullyQualifiedNamespace = module.servicebus.fully_qualified_namespace

    OrderStateStorage__tableEndpoint = module.storage.primary_table_endpoint

    APPLICATIONINSIGHTS_CONNECTION_STRING = module.monitoring.application_insights_connection_string
  }

  tags = local.common_tags
}