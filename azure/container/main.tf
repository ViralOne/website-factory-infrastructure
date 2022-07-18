# Create App Service plan to define the capacity and resources to be shared among the app services that will be assigned to that plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = local.service_plan.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = local.service_plan.kind
  sku_name            = local.service_plan.size
}

resource "azurerm_container_group" "contsainer" {
  name                = "${local.tags.org_name}-continst"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  ip_address_type     = local.container.ip_address_type
  dns_name_label      = "${local.tags.org_name}-continst"
  os_type             = local.container.os

  container {
    name   = "${local.tags.org_name}-container"
    image  = "dockersoap/nginx-whoami" #after tests change with "${local.container.image}:${local.container.tag}"
    cpu    = local.container.cpu
    memory = local.container.memory

    environment_variables = {
      APP_DEBUG               = true
      APP_ENV                 = "production"
      APP_KEY                 = "key"
      WEBSITE_FACTORY_EDITION = "ong"
      CACHE_DRIVER            = "redis"
      SESSION_DRIVER          = "redis"
      RESPONSE_CACHE_DRIVER   = "redis"
      DB_CONNECTION           = "pgsql"
      DB_HOST                 = azurerm_private_dns_zone.dns_zone.name
      DB_PORT                 = "5432"
      DB_DATABASE             = "postgres"
      DB_USERNAME             = local.db_config.admin_user
      DB_PASSWORD             = local.db_config.admin_pass
      MAIL_MAILER             = "smtp"
      MAIL_HOST               = "host"
      MAIL_PORT               = "1234"
      MAIL_USERNAM            = "username"
      MAIL_PASSWORD           = "password"
      MAIL_ENCRYPTION         = "tls"
      MAIL_FROM_ADDRESS       = "email@service.com"
      FILESYSTEM_DRIVER       = "azure"
      FILESYSTEM_CLOUD        = "azure"
      AZURE_STORAGE_NAME      = azurerm_storage_account.storage_account.name
      AZURE_STORAGE_KEY       = azurerm_storage_account.storage_account.primary_access_key
      AZURE_STORAGE_CONTAINER = "data"
    }

    ports {
      port     = 8080 //temporary port for testing
      protocol = "TCP"
    }

    ports {
      port     = 80
      protocol = "TCP"
    }

    ports {
      port     = 443
      protocol = "TCP"
    }
  }

  exposed_port {      //The exposed_port can only contain ports that are also exposed on one or more containers in the group.  
    port     = "8080" //temporary port for testing
    protocol = "TCP"
  }
}


# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = local.azure_configs.resource_name
  location = local.azure_configs.region
}
