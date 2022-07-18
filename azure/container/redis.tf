# resource "azurerm_redis_cache" "redis_instance" {
#   name                = format("%s-%s", local.tags.org_name, "cache")
#   location            = azurerm_resource_group.resource_group.location
#   resource_group_name = azurerm_resource_group.resource_group.name
#   capacity            = 1
#   family              = "C"
#   sku_name            = "Basic"
#   enable_non_ssl_port = false
#   minimum_tls_version = "1.2"

#   redis_configuration {
#   }
# }
