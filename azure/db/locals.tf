locals {

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"

  }

  db_config = {
    description = "Service configuration"
    name        = "website-factory-db"
    sku         = "B_Gen5_1" # Smallestype

    admin_user              = "psqladmin"
    admin_pass              = "H@Sh1CoR3!"
    version                 = "9.5"
    ssl_enforcement_enabled = true

    storage_mb                   = 5120
    backup_retention_days        = 7
    geo_redundant_backup_enabled = false
    auto_grow_enabled            = true

  }
}
