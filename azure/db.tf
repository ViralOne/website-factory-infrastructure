# Create postgresql database
resource "azurerm_postgresql_database" "websitefactory_db" {
  name                = local.db_config.name
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_postgresql_flexible_server.websitefactory_db_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

resource "azurerm_postgresql_flexible_server" "websitefactory_db_server" {
  name                = local.db_config.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku_name = local.db_config.sku

  storage_mb                   = local.db_config.storage_mb
  backup_retention_days        = local.db_config.backup_retention_days
  geo_redundant_backup_enabled = local.db_config.geo_redundant_backup_enabled

  administrator_login    = local.db_config.admin_user
  administrator_password = local.db_config.admin_pass
  version                = local.db_config.version
  zone                   = local.db_config.zone
}
