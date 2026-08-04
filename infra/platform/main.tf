locals {
  prefix = "contoso-order-platform-${var.environment}"

  names = {
    resource_group = coalesce(
      var.name_overrides.resource_group,
      "${local.prefix}-rg"
    )

    storage = coalesce(
      var.name_overrides.storage,
      "stcontosoorder${var.environment}jm"
    )

    service_bus = coalesce(
      var.name_overrides.service_bus,
      "${local.prefix}-servicebus"
    )

    function_app = coalesce(
      var.name_overrides.function_app,
      "${local.prefix}-func"
    )

    function_plan = coalesce(
      var.name_overrides.function_plan,
      "${local.prefix}-func-plan"
    )

    function_host_storage = coalesce(
      var.name_overrides.function_host_storage,
      "stcontosofunc${var.environment}jm"
    )

    logic_app = coalesce(
      var.name_overrides.logic_app,
      "${local.prefix}-place-order"
    )

    log_analytics = coalesce(
      var.name_overrides.log_analytics,
      "${local.prefix}-logs"
    )

    application_insights = coalesce(
      var.name_overrides.application_insights,
      "${local.prefix}-appinsights"
    )

    key_vault = coalesce(
      var.name_overrides.key_vault,
      "${local.prefix}-kv"
    )

    apim = coalesce(
      var.name_overrides.apim,
      "${local.prefix}-apim"
    )
  }

  common_tags = {
    application = "contoso-order-platform"
    environment = var.environment
    managed_by  = "terraform"
    owner       = "integration-platform"
  }
}

resource "azurerm_resource_group" "integration" {
  name     = local.names.resource_group
  location = var.location

  tags = local.common_tags
}