terraform {
  backend "azurerm" {
    use_cli              = true
    use_azuread_auth     = true
    resource_group_name  = "contoso-order-platform-stage-tfstate-rg"
    storage_account_name = "stcontosotfstatejm"
    container_name       = "tfstate"
    key                  = "contoso-order-platform-stage.tfstate"
  }
}