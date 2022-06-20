output "private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.dns_zone.name
}

output "azurerm_virtual_network_id" {
  value = data.azurerm_virtual_network.vn_network.id
}
