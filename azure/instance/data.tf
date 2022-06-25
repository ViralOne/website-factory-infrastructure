data "azurerm_virtual_network" "vn_network" {
  name                = "website-factory-network"
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_resource_group" "resource_group" {
  name = "rs-website-factory"
}

output "id" {
  value = data.azurerm_resource_group.resource_group.id
}
