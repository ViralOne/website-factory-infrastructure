terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

resource "azurerm_resource_group" "websitefactory_resources" {
  name     = local.azure_configs.resource_name
  location = local.azure_configs.region
}

resource "azurerm_postgresql_server" "websitefactory_db_server" {
  name                = "postgresql-server-1"
  location            = azurerm_resource_group.websitefactory_resources.location
  resource_group_name = azurerm_resource_group.websitefactory_resources.name

  sku_name = local.db_config.sku

  storage_mb                   = local.db_config.storage_mb
  backup_retention_days        = local.db_config.backup_retention_days
  geo_redundant_backup_enabled = local.db_config.geo_redundant_backup_enabled
  auto_grow_enabled            = local.db_config.auto_grow_enabled

  administrator_login          = local.db_config.admin_user
  administrator_login_password = local.db_config.admin_pass
  version                      = local.db_config.version
  ssl_enforcement_enabled      = local.db_config.ssl_enforcement_enabled
  
}

resource "azurerm_postgresql_database" "websitefactory_db" {
  name                = local.db_config.name
  resource_group_name = azurerm_resource_group.websitefactory_resources.name
  server_name         = azurerm_postgresql_server.websitefactory_db_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
