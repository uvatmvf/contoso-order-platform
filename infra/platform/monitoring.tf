module "monitoring" {
  source = "../modules/monitoring"

  log_analytics_name        = local.names.log_analytics
  application_insights_name = local.names.application_insights

  resource_group_name = azurerm_resource_group.integration.name
  location            = azurerm_resource_group.integration.location

  retention_in_days    = 30
  daily_data_cap_in_gb = 1
  sampling_percentage  = 100

  tags = local.common_tags
}