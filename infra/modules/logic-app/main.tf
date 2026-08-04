resource "azurerm_logic_app_workflow" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }

  tags = merge(
    var.tags,
    {
      component = "workflow"
    }
  )
}

resource "azurerm_logic_app_trigger_http_request" "place_order" {
  name         = "When_a_place_order_request_is_received"
  logic_app_id = azurerm_logic_app_workflow.this.id
  method       = "POST"

  schema = jsonencode({
    type = "object"

    required = [
      "orderId",
      "customerId",
      "productId",
      "quantity",
      "paymentMethodId",
      "amount",
      "currency"
    ]

    properties = {
      orderId = {
        type = "string"
      }

      customerId = {
        type = "string"
      }

      productId = {
        type = "string"
      }

      quantity = {
        type    = "integer"
        minimum = 1
      }

      paymentMethodId = {
        type = "string"
      }

      amount = {
        type    = "number"
        minimum = 0
      }

      currency = {
        type      = "string"
        minLength = 3
        maxLength = 3
      }
    }
  })
}

resource "azurerm_logic_app_action_custom" "send_place_order" {
  name         = "Send_place_order_to_Service_Bus"
  logic_app_id = azurerm_logic_app_workflow.this.id

  body = jsonencode({
    type = "Http"

    inputs = {
      method = "POST"

      uri = "https://${var.service_bus_namespace}/${var.queue_name}/messages"

      headers = {
        Content-Type = "application/json"

        BrokerProperties = "@{concat('{\"MessageId\":\"', triggerBody()?['orderId'], '\",\"CorrelationId\":\"', triggerBody()?['orderId'], '\",\"Label\":\"PlaceOrder\"}')}"
      }

      body = "@triggerBody()"

      authentication = {
        type     = "ManagedServiceIdentity"
        audience = "https://servicebus.azure.net/"
      }
    }

    runAfter = {}
  })

  depends_on = [
    azurerm_logic_app_trigger_http_request.place_order
  ]
}

resource "azurerm_logic_app_action_custom" "accepted_response" {
  name         = "Return_accepted_response"
  logic_app_id = azurerm_logic_app_workflow.this.id

  body = jsonencode({
    type = "Response"

    inputs = {
      statusCode = 202

      headers = {
        Content-Type = "application/json"
      }

      body = {
        orderId = "@{triggerBody()?['orderId']}"
        status  = "Accepted"
        message = "The order was accepted for asynchronous processing."
      }
    }

    runAfter = {
      Send_place_order_to_Service_Bus = [
        "Succeeded"
      ]
    }
  })

  depends_on = [
    azurerm_logic_app_action_custom.send_place_order
  ]
}