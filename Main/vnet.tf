resource "azurerm_virtual_network" "sillk-vnet" {
  name                = "sillk-vnet"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"] //'Not sure if these need changed

  subnet {
    name           = "default"
    address_prefix = "10.0.0.0/24"
  }

  subnet {
    name           = "AzureFirewallSubnet"
    address_prefix = "10.0.1.0/26"

  }

  # subnet {
  #   name           = "vm-subnet"
  #   address_prefix = "10.0.2.0/24"
  #   security_group = sillk-vm-nsg.sillk-vnet.id
  # }

  # subnet {
  #   name           = "netapp-subnet"
  #   address_prefix = "10.0.3.0/24"
  #   security_group = sillk-netapp-nsg.sillk-vnet.id
  # }

  # subnet {
  #   name           = "endpoint-subnet"
  #   address_prefix = "10.0.4.0/24"
  #   security_group = sillk-endpoint-nsg.sillk-vnet.id
  # }
}
