# # Create postgresql database
# resource "azurerm_postgresql_flexible_server" "websitefactory_db_server" {
#   name                = local.db_config.name
#   location            = azurerm_resource_group.resource_group.location
#   resource_group_name = azurerm_resource_group.resource_group.name

#   sku_name   = local.db_config.sku
#   storage_mb = local.db_config.storage_mb

#   backup_retention_days        = local.db_config.backup_retention_days
#   geo_redundant_backup_enabled = local.db_config.geo_redundant_backup_enabled

#   administrator_login    = local.db_config.admin_user
#   administrator_password = local.db_config.admin_pass
#   version                = local.db_config.version
#   zone                   = local.db_config.zone
# }

# # Manages a PostgreSQL Flexible Server DB
# resource "azurerm_postgresql_flexible_server_database" "server_database" {
#   name      = format("%s-%s", "db", local.tags.org_name)
#   server_id = azurerm_postgresql_flexible_server.websitefactory_db_server.id
#   collation = "en_US.utf8"
#   charset   = "utf8"
# }

# resource "azurerm_postgresql_flexible_server_firewall_rule" "public_network_access" {
#   name             = "PublicNetworkAccess"
#   server_id        = azurerm_postgresql_flexible_server.websitefactory_db_server.id
#   start_ip_address = "0.0.0.0"
#   end_ip_address   = "0.0.0.0"
# }

# # To avoid replacement, you need to import the resource:
# # terraform import random_password.pwd securepassword
# resource "random_password" "pwd" {
#   length           = 16
#   special          = true
#   override_special = "_%@"

#   lifecycle {
#     ignore_changes = [
#       length,
#       special,
#       override_special
#     ]
#   }
# }
