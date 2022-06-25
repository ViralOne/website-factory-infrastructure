terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = local.azure_configs.resource_name
  location = local.azure_configs.region
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

resource "azurerm_postgresql_database" "websitefactory_db" {
  name                = local.db_config.name
  resource_group_name = azurerm_resource_group.resource_group.name
  server_name         = azurerm_postgresql_flexible_server.websitefactory_db_server.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}

# Give user access to storage
resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  name                = "wf_user_identity"
  location            = local.azure_configs.region
  resource_group_name = "rs-website-factory"
}

# and the role assignment to this identity
resource "azurerm_role_assignment" "user_role_assigment" {
  scope              = azurerm_resource_group.resource_group.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id       = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}

# Create DNS name for postgress
resource "azurerm_private_dns_zone" "dns_zone" {
  name                = "website-factory-1.postgres.database.azure.com" #change this to your DNS zone name
  resource_group_name = azurerm_resource_group.resource_group.name
}
