resource "azurerm_cdn_frontdoor_profile" "sillkFDProfile" {
  name                = "sillkFDProfile"
  resource_group_name = azurerm_resource_group.SiLLK.name
  sku_name            = "Standard_AzureFrontDoor"
}

resource "azurerm_cdn_frontdoor_endpoint" "sillkFDEndpoint" {
  name                     = "sillkFDEndpoint"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.sillkFDProfile.id

  #  tags = {
  #    ENV = "example"
  # }
}
resource "azurerm_cdn_frontdoor_origin_group" "originGroup" {
  name                     = "originGroup"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.sillkFDProfile.id

  load_balancing {}
}

resource "azurerm_cdn_frontdoor_origin" "LBOrigin" {
  name                          = "LBOrigin"
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.originGroup.id
  enabled                       = true

  certificate_name_check_enabled = false

  host_name          = "10.0.0.4" #will need actual load balancer IP, 10.0.0.4 stuff is used locally to test.
  http_port          = 80
  https_port         = 443
  origin_host_header = "10.0.0.4"
  priority           = 1
  weight             = 1
}


