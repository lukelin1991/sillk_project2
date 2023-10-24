resource "azurerm_cdn_frontdoor_firewall_policy" "sillkWAFpolicy" { # remember to change "example" to something else when we start this.
  name                              = "sillkWAFpolicy"
  resource_group_name               = var.rg_name
  sku_name                          = azurerm_cdn_frontdoor_profile.sillkFDProfile.sku_name # not connected to azureFrontDoor profile YET.
  enabled                           = true
  mode                              = "Prevention"
  custom_block_response_status_code = 403
}
