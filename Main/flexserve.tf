data "azurerm_resource_group" "database" {
  name = "database"
}

data "azure_mysql_flexible_server" "database" {
  name                = "conoco-project2"
  resource_group_name = data.azurerm_resource_group.database.name
}

resource "azurerm_private_endpoint" "dataprivend" {
  name                = "sillk-mysql"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name
  subnet_id           = azurerm_subnet.endpoint-subnet.id

  private_service_connection {
    name                           = "sillk-privateserviceconnection"
    private_connection_resource_id = data.azurerm_mysql_flexible_server.database.id
    subresource_names              = ["mysql"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "main" {
  name                = "bjgomes.mysql.database.azure.com"
  resource_group_name = azurerm_resource_group.SiLLK.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "exampleVnetZone.com"
  private_dns_zone_name = azurerm_private_dns_zone.main.name
  virtual_network_id    = azurerm_virtual_network.sillk-vnet.id
  resource_group_name   = azurerm_resource_group.SiLLK.name
}

resource "azurerm_mysql_flexible_server" "main" {
  name                   = "bjgomes-fs"
  resource_group_name    = azurerm_resource_group.SiLLK.name
  location               = azurerm_resource_group.SiLLK.location
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.endpoint-subnet.id
  private_dns_zone_id    = azurerm_private_dns_zone.main.id
  sku_name               = "GP_Standard_B1ms"

  depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}

resource "azurerm_mysql_flexible_database" "main" {
  name                = "bjgomes-mysql-flexible-database"
  resource_group_name = azurerm_resource_group.SiLLK.name
  server_name         = azurerm_mysql_flexible_server.main.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
