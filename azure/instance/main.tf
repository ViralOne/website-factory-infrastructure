# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
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
  }
}
