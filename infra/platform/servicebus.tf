module "servicebus" {
  source = "../modules/servicebus"

  name                = local.names.service_bus
  resource_group_name = azurerm_resource_group.integration.name
  location            = azurerm_resource_group.integration.location
  sku                 = "Standard"

  queues = {
    place_order = {
      name = "place-order"
    }

    reserve_inventory = {
      name = "reserve-inventory"
    }
  }

  topic_name = "order-events"

  subscriptions = {
    authorize_payment = {
      name       = "authorize-payment"
      rule_name  = "InventoryReserved"
      sql_filter = "sys.Label = 'InventoryReserved'"
    }

    complete_order = {
      name       = "complete-order"
      rule_name  = "PaymentAuthorized"
      sql_filter = "sys.Label = 'PaymentAuthorized'"
    }
  }

  tags = merge(
    local.common_tags,
    {
      component = "messaging"
    }
  )
}