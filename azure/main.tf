# Create App Service plan to define the capacity and resources to be shared among the app services that will be assigned to that plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = local.service_plan.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = local.service_plan.kind
  sku_name            = local.service_plan.size
}

resource "azurerm_linux_web_app" "app_service" {
  name                = local.service_config.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    app_command_line = ""
    application_stack {
      docker_image     = local.docker.image
      docker_image_tag = local.docker.tag
    }
  }

  app_settings = {
    "APP_ENV"                             = "production"
    "APP_KEY"                             = "some-key"
    "WEBSITE_FACTORY_EDITION"             = "edge"
    "DB_CONNECTION"                       = "pgsql"
    "DB_HOST"                             = "${azurerm_private_dns_zone.dns_zone.name}"
    "DB_PORT"                             = "5432"
    "DB_DATABASE"                         = "postgres"
    "DB_USERNAME"                         = "${local.db_config.admin_user}"
    "DB_PASSWORD"                         = "${local.db_config.admin_pass}"
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
    value = azurerm_private_dns_zone.dns_zone.name
  }
}

# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = local.azure_configs.resource_name
  location = local.azure_configs.region
}
