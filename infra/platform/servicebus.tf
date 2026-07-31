resource "azurerm_servicebus_namespace" "integration" {
  name                = local.names.service_bus
  location            = azurerm_resource_group.integration.location
  resource_group_name = azurerm_resource_group.integration.name
  sku                 = "Standard"

  tags = merge(
    local.common_tags,
    {
      component = "messaging"
    }
  )
}

locals {
  service_bus_queues = {
    place_order = {
      name = "place-order"
    }

    reserve_inventory = {
      name = "reserve-inventory"
    }
  }
  service_bus_subscriptions = {
    authorize_payment = {
      name = "authorize-payment"
    }

    complete_order = {
      name = "complete-order"
    }
  }
}

resource "azurerm_servicebus_queue" "integration" {
  for_each = local.service_bus_queues

  name         = each.value.name
  namespace_id = azurerm_servicebus_namespace.integration.id

  lock_duration                        = "PT1M"
  max_delivery_count                   = 10
  dead_lettering_on_message_expiration = true
}

resource "azurerm_servicebus_topic" "integration" {
  name         = "order-events"
  namespace_id = azurerm_servicebus_namespace.integration.id

  max_size_in_megabytes = 1024
}

resource "azurerm_servicebus_subscription" "integration" {
  for_each = local.service_bus_subscriptions

  name     = each.value.name
  topic_id = azurerm_servicebus_topic.integration.id

  max_delivery_count = 10
}