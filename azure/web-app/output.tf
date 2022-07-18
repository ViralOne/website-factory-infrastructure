output "db_url" {
  value = azurerm_private_dns_zone.dns_zone.name
}

output "db_user" {
  value     = local.db_config.admin_user
  sensitive = true
}

resource "local_file" "db_pwd" {
  content  = local.db_config.admin_pass
  filename = "${format("%s-%s", "pwd", local.tags.org_name)}.yaml"
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

resource "local_file" "storage_key" {
  content  = azurerm_storage_account.storage_account.primary_access_key
  filename = "${format("%s-%s", "storage_key", local.tags.org_name)}.yaml"
}
