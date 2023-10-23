# Create an Azure Key Vault
data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "testsillkkv" {
  name                        = "testsillkkv"
  location                    = azurerm_resource_group.testsillk.location
  resource_group_name         = azurerm_resource_group.testsillk.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
}

