locals {

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = "rs-website-factory"
    region        = "West Europe"
  }

  network = {
    description      = "Network configuration"
    vn_name          = "website-factory-network"
    vn_address_space = ["10.0.0.0/16"]

    subnet_name             = "website-factory-sn"
    subnet_address_prefixes = ["10.0.2.0/24"]
  }

  service_plan = {
    description = "Service plan details"
    name        = "websitefactory-svc-plan"
    tier        = "Standard"
    size        = "B1" # Smallest tier but not free, F1 tier didn't allow to apply  
    kind        = "Linux"
  }

  storage_config = {
    account_name     = "wfaccount"
    tier             = "Standard" # Smalles type
    replication_type = "LRS"      #Locally Redundant Storage
  }

  service_config = {
    description = "Service configuration"
    name        = "website-factory"
  }

  docker = {
    image = "code4romania/website-factory"
    tag   = "edge"
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
}
