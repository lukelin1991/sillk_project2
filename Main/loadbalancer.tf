resource "azurerm_lb" "sillkLb" {
  name                = "sillkLb"
  location            = var.location
  resource_group_name = var.rg_name

}