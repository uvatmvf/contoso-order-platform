resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_name
  resource_group_name = var.resource_group_name
  location            = var.location

  sku               = "PerGB2018"
  retention_in_days = var.retention_in_days

  tags = merge(
    var.tags,
    {
      component = "observability"
    }
  )
}

resource "azurerm_application_insights" "this" {
  name                = var.application_insights_name
  resource_group_name = var.resource_group_name
  location            = var.location

  application_type = "web"
  workspace_id     = azurerm_log_analytics_workspace.this.id

  daily_data_cap_in_gb                 = var.daily_data_cap_in_gb
  daily_data_cap_notifications_enabled = true
  sampling_percentage                  = var.sampling_percentage

  tags = merge(
    var.tags,
    {
      component = "observability"
    }
  )
}