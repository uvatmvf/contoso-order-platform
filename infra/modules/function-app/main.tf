resource "azurerm_storage_account" "host" {
  name                     = var.host_storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tags = merge(
    var.tags,
    {
      component = "function-host-storage"
    }
  )
}

resource "azurerm_service_plan" "this" {
  name                = var.service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location

  os_type  = "Windows"
  sku_name = var.service_plan_sku

  tags = merge(
    var.tags,
    {
      component = "function-hosting"
    }
  )
}

resource "azurerm_windows_function_app" "this" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id = azurerm_service_plan.this.id

  storage_account_name       = azurerm_storage_account.host.name
  storage_account_access_key = azurerm_storage_account.host.primary_access_key

  https_only                  = true
  functions_extension_version = "~4"

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = false

    application_stack {
      dotnet_version              = var.dotnet_version
      use_dotnet_isolated_runtime = true
    }
  }

  app_settings = merge(
    {
      "WEBSITE_RUN_FROM_PACKAGE" = "1"
    },
    var.app_settings
  )

  tags = merge(
    var.tags,
    {
      component = "functions"
    }
  )
}