output "db_url" {
  value = azurerm_private_dns_zone.dns_zone.name
}

output "db_user" {
  value = local.db_config.admin_user
  sensitive = true
}

output "db_password" {
  value = local.db_config.admin_pass
  sensitive = true
}

output "lb_ip" {
  value = azurerm_public_ip.lb_ip.ip_address
}

output "web_app_hostname" {
  value = azurerm_linux_web_app.app_service.default_hostname
}

output "db_public_accesible" {
  value = azurerm_postgresql_flexible_server.websitefactory_db_server.public_network_access_enabled
}

output "redis_host" {
  value = azurerm_redis_cache.redis_instance.hostname
}

output "redis_primary_connection_string" {
  value = azurerm_redis_cache.redis_instance.primary_connection_string
  sensitive = true
}

# output "storage_id" {
#   value = azurerm_storage_account_customer_managed_key.costumer_key.id
# }
