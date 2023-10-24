#Create Private Endpoint for Key Vault

resource "azurerm_private_endpoint" "vaultprivend" {
  name                = "sillk-kvault"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name
  subnet_id           = azurerm_subnet.endpoint-subnet.id

  private_service_connection {
    name                           = "sillk-privateserviceconnection"
    private_connection_resource_id = azurerm_key_vault.sillkkv.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "sillk-dns-zone-group"
    private_dns_zone_ids = [azurerm_private_dns_zone.vaultprivend.id]
  }
}

resource "azurerm_private_dns_zone" "vaultprivend" {
  name                = "privatelink.key.vault.windows.net"
  resource_group_name = azurerm_resource_group.SiLLK.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "vaultprivend" {
  name                  = "lepe2-link"
  resource_group_name   = azurerm_resource_group.SiLLK.name
  private_dns_zone_name = azurerm_private_dns_zone.vaultprivend.name
  virtual_network_id    = azurerm_virtual_network.sillk-vnet.id
}