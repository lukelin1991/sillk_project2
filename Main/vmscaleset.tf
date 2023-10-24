resource "azurerm_linux_virtual_machine_scale_set" "sillkvmss" {
  name                = "sillkvmss"
  resource_group_name = var.rg_name
  location            = var.location
  sku                 = "Standard_B2s"
  instances           = 2
  admin_username      = "sillk"
  admin_password      = "$iLLK"


  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Premium_LRS"
    caching              = "ReadWrite"
  }

  network_interface { #unfinished requires NIC
    name    = "example"
    primary = true

    ip_configuration { #unfinished, requires ipconfig from subnet.
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.vm-subnet.id //updated BJ 6:04pm 11/23
    }
  }
}
