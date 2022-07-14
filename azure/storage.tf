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
  min_tls_version          = "TLS1_2"
}

# Get costumer managed key
resource "azurerm_key_vault" "vault_key" {
  name                = format("%s-%s", "vault-key", local.tags.org_name)
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"

  purge_protection_enabled = false
}

resource "azurerm_key_vault_access_policy" "storage" {
  key_vault_id = azurerm_key_vault.vault_key.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = azurerm_storage_account.storage_account.identity.0.principal_id
  key_permissions    = ["Get", "Create", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get"]
}

resource "azurerm_key_vault_access_policy" "client" {
  key_vault_id = azurerm_key_vault.vault_key.id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = data.azurerm_client_config.current.object_id

  key_permissions    = ["Get", "Create", "Delete", "List", "Restore", "Recover", "UnwrapKey", "WrapKey", "Purge", "Encrypt", "Decrypt", "Sign", "Verify"]
  secret_permissions = ["Get"]
}


resource "azurerm_key_vault_key" "key_vault_key" {
  name         = "tfex-key"
  key_vault_id = azurerm_key_vault.vault_key.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts     = ["decrypt", "encrypt", "sign", "unwrapKey", "verify", "wrapKey"]

  depends_on = [
    azurerm_key_vault_access_policy.client,
    azurerm_key_vault_access_policy.storage,
  ]
}

resource "azurerm_storage_account_customer_managed_key" "costumer_key" {
  storage_account_id = azurerm_storage_account.storage_account.id
  key_vault_id       = azurerm_key_vault.vault_key.id
  key_name           = azurerm_key_vault_key.key_vault_key.name
}
