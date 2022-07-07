locals {
  tags = {
    env      = "dev"
    org_name = "websitefactory"
  }

  azure_configs = {
    description   = "Azure necessary configurations"
    resource_name = format("%s-%s", "rs", local.tags.org_name)
    region        = "France Central"
  }

  network = {
    description      = "Network configuration"
    vn_name          = format("%s-%s", "network", local.tags.org_name)
    vn_address_space = ["10.0.0.0/16"]

    subnet_name             = format("%s-%s", "sn", local.tags.org_name)
    subnet_address_prefixes = ["10.0.2.0/24"]
  }

  service_plan = {
    description = "Service plan details"
    name        = format("%s-%s", "svc-plan", local.tags.org_name)
    tier        = "Standard"
    size        = "B1" # Smallest tier but not free, F1 tier didn't allow to apply  
    kind        = "Linux"
  }

  storage_config = {
    account_name     = local.tags.org_name
    tier             = "Standard" # Smalles type
    replication_type = "LRS"      #Locally Redundant Storage
  }

  service_config = {
    description = "Service configuration"
    name        = local.tags.org_name
  }

  docker = {
    image = "code4romania/website-factory"
    tag   = "edge"
  }

  db_config = {
    description = "Service configuration"
    name        = format("%s-%s", "postgresql", local.tags.org_name)
    sku         = "B_Standard_B1ms"

    admin_user = "psqladmin"
    admin_pass = "H@Sh1CoR3!"
    #admin_pass = random_password.pwd.result
    version    = "13"

    storage_mb                    = 32768
    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false
    public_network_access_enabled = true
    zone                          = "2" 
  }
}
