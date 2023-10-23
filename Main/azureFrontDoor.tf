resource "azurerm_cdn_frontdoor_profile" "example" {
  name                = "sillkFDprofile"
  resource_group_name = azurerm_resource_group.example.name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "example" {
  name                     = "sillk-FDendpoint"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.example.id

#  tags = {
#    ENV = "example"
 # }
}
resource "azurerm_cdn_frontdoor_origin_group" "example" {
  name                     = "origingroup"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.example.id

  load_balancing {}
}

resource "azurerm_cdn_frontdoor_origin" "example" {
  name                          = "LBorigin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.example.id
  enabled                       = true

  certificate_name_check_enabled = false

  host_name          = "10.0.0.4"
  http_port          = 80
  https_port         = 443
  origin_host_header = "10.0.0.4"
  priority           = 1
  weight             = 1
}


