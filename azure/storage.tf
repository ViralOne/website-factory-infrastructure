# Give user access to storage
resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  name                = format("%s-%s", "user-identity", local.tags.org_name)
  location            = local.azure_configs.region
  resource_group_name = azurerm_resource_group.resource_group.name
}

# and the role assignment to this identity
resource "azurerm_role_assignment" "user_role_assigment" {
  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_config.account_name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = local.storage_config.tier
  account_replication_type = "LRS"
}
