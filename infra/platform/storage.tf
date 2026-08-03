module "storage" {
  source = "../modules/storage"

  name                = local.names.storage
  resource_group_name = azurerm_resource_group.integration.name
  location            = azurerm_resource_group.integration.location

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  tables = [
    "OrderProcessing"
  ]

  tags = merge(
    local.common_tags,
    {
      component           = "storage"
      data_classification = "internal"
    }
  )
}