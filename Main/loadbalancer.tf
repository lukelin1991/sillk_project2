resource "azurerm_lb" "example" {
  name                = "sillk-LoadBalancer"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

}