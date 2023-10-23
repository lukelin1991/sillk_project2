resource "azurerm_subnet" "vm-subnet" {
  name                 = "vm-subnet"
  resource_group_name  = azurerm_resource_group.SiLLK.name
  virtual_network_name = azurerm_virtual_network.sillk-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "netapp-subnet" {
  name                 = "netapp-subnet"
  resource_group_name  = azurerm_resource_group.SiLLK.name
  virtual_network_name = azurerm_virtual_network.sillk-vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}

resource "azurerm_subnet" "endpoint-subnet" {
  name                 = "endpoint-subnet"
  resource_group_name  = azurerm_resource_group.SiLLK.name
  virtual_network_name = azurerm_virtual_network.sillk-vnet.name
  address_prefixes     = ["10.0.4.0/24"]
}
