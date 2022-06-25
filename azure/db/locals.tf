locals {

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"

  }

  db_config = {
    description   = "Service configuration"
    name          = "postgresql-server-1"
    resource_name = "website-factory-db"
    sku           = "GP_Standard_D4s_v3"

    admin_user = "psqladmin"
    admin_pass = "H@Sh1CoR3!"
    version    = "12"

    storage_mb                   = 32768
    backup_retention_days        = 7
    geo_redundant_backup_enabled = false
    zone                         = 1
  }

  resource_group_data = {
    id   = data.azurerm_resource_group.resource_group.id
  }
}
