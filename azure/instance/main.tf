# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
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

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "vn_network" {
  name                = "website-factory-network"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "website-factory-sn"
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vn_network.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

# Create App Service plan to define the capacity and resources to be shared among the app services that will be assigned to that plan
resource "azurerm_app_service_plan" "app_service_plan" {
  name                = local.service_plan.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  kind                = local.service_plan.kind
  reserved            = local.service_plan.reserved

  sku {
    tier = local.service_plan.tier
    size = local.service_plan.size
  }
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_config.account_name
  resource_group_name      = data.azurerm_resource_group.resource_group.name
  location                 = data.azurerm_resource_group.resource_group.location
  account_tier             = local.storage_config.tier
  account_replication_type = "LRS"
}

resource "azurerm_app_service" "app_service" {
  name                = local.service_config.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  site_config {
    app_command_line = ""
    linux_fx_version = "DOCKER|code4romania/website-factory:edge"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
    "APP_ENV"                             = "production"
    "APP_KEY"                             = "some-key"
    "WEBSITE_FACTORY_EDITION"             = "edge"
    "DB_CONNECTION"                       = "pgsql"
    "DB_HOST"                             = "URL"
    "DB_PORT"                             = "5432"
    "DB_DATABASE"                         = "db_name"
    "DB_USERNAME"                         = "db_user"
    "DB_PASSWOR"                          = "db_pass"
    "REDIS_HOST"                          = "host"
    "REDIS_PASSWORD"                      = "null"
    "REDIS_PORT"                          = "6379"
    "MAIL_MAILER"                         = "smtp"
    "MAIL_HOST"                           = "host"
    "MAIL_PORT"                           = "1234"
    "MAIL_USERNAM"                        = "username"
    "MAIL_PASSWORD"                       = "password"
    "MAIL_ENCRYPTION"                     = "tls"
    "MAIL_FROM_ADDRESS"                   = "email@service.com"
    "FILESYSTEM_DRIVER"                   = "storage_account"
    "FILESYSTEM_CLOUD"                    = "storage_account"
  }

  connection_string {
    name  = "website-factory-db-connection"
    type  = "PostgreSQL"
    value = "website-factory-1.postgres.database.azure.com" #Change this to your Postgres server name
  }
}
