resource "azurerm_cdn_frontdoor_firewall_policy" "example" {
  name                              = "sillkWAFpolicy"
  resource_group_name               = azurerm_resource_group.example.name
  sku_name                          = azurerm_cdn_frontdoor_profile.example.sku_name
  enabled                           = true
  mode                              = "Prevention"
  custom_block_response_status_code = 403
}