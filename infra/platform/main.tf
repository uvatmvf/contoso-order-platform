locals {
  prefix = "contoso-order-platform-${var.environment}"

  names = {
    resource_group        = "${local.prefix}-rg"
    storage               = "stcontosoorder${var.environment}jm"
    service_bus           = "${local.prefix}-servicebus"
    function_app          = "${local.prefix}-func"
    function_plan         = "${local.prefix}-func-plan"
    function_host_storage = "stcontosofunc${var.environment}jm"
    logic_app             = "${local.prefix}-place-order"
    log_analytics         = "${local.prefix}-logs"
    application_insights  = "${local.prefix}-appinsights"
    key_vault             = "${local.prefix}-kv"
    apim                  = "${local.prefix}-apim"
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