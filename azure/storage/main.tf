terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

resource "azurerm_resource_group" "storage_rs" {
  name     = local.azure_configs.resource_name
  location = local.azure_configs.region
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_config.account_name
  resource_group_name      = azurerm_resource_group.storage_rs.name
  location                 = azurerm_resource_group.storage_rs.location
  account_tier             = local.storage_config.tier
  account_replication_type = "LRS"
}
