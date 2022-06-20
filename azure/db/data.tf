data "azurerm_private_dns_zone" "dns_zone" {
  name                = "website-factory-1.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.websitefactory_resources.name
}

data "azurerm_virtual_network" "vn_network" {
  name                = "website-factory-network"
  resource_group_name = azurerm_resource_group.websitefactory_resources.name
}
