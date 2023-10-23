resource "azurerm_network_security_group" "vm-nsg" {
  name                = "vm-nsg"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name

  #   security_rule {
  #     name                       = "test123"
  #     priority                   = 100
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     = "*"
  #     source_address_prefix      = "*"
  #     destination_address_prefix = "*"
  #   }
}

resource "azurerm_network_security_group" "netapp-nsg" {
  name                = "netapp-nsg"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name

  #   security_rule {
  #     name                       = "test123"
  #     priority                   = 100
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     = "*"
  #     source_address_prefix      = "*"
  #     destination_address_prefix = "*"
  #   }
}

resource "azurerm_network_security_group" "endpoint-nsg" {
  name                = "endpoint-nsg"
  location            = azurerm_resource_group.SiLLK.location
  resource_group_name = azurerm_resource_group.SiLLK.name

  #   security_rule {
  #     name                       = "test123"
  #     priority                   = 100
  #     direction                  = "Inbound"
  #     access                     = "Allow"
  #     protocol                   = "Tcp"
  #     source_port_range          = "*"
  #     destination_port_range     = "*"
  #     source_address_prefix      = "*"
  #     destination_address_prefix = "*"
  #   }
}

resource "azurerm_subnet_network_security_group_association" "vm-sga" {
  subnet_id                 = azurerm_subnet.vm-subnet.id
  network_security_group_id = azurerm_network_security_group.vm-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "netapp-sga" {
  subnet_id                 = azurerm_subnet.netapp-subnet.id
  network_security_group_id = azurerm_network_security_group.netapp-nsg.id
}

resource "azurerm_subnet_network_security_group_association" "endpoint-sga" {
  subnet_id                 = azurerm_subnet.endpoint-subnet.id
  network_security_group_id = azurerm_network_security_group.endpoint-nsg.id
}
