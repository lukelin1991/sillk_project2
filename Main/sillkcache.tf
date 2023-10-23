# Create an Azure Cache for Redis
resource "azurerm_redis_cache" "cache" {
  name                = "sillk-cache"
  resource_group_name = azurerm_resource_group.SiLLK.name
  location            = azurerm_resource_group.SiLLK.location
  capacity            = 0
  family              = "C"
  sku_name            = "Basic"
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
  redis_configuration {

  }
}