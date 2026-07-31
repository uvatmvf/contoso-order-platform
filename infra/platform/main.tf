locals {
  prefix = "contoso-order-platform-${var.environment}"

  names = {
    resource_group = "${local.prefix}-rg"
    storage        = "stcontosoorder${var.environment}jm"
    service_bus    = "${local.prefix}-servicebus"
    function_app   = "${local.prefix}-func"
    key_vault      = "${local.prefix}-kv"
    apim           = "${local.prefix}-apim"
  }

  common_tags = {
    application = "contoso-order-platform"
    environment = var.environment
    managed_by  = "terraform"
    owner       = "integration-platform"
  }
}

resource "azurerm_resource_group" "integration" {
  name     = "${local.prefix}-rg"
  location = "West US 2"

  tags = local.common_tags
}