# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
# https://nevaluoto.fi/posts/deploying-linux-vm-on-azure-using-terraform/
# https://www.cryingcloud.com/blog/2024/7/15/terraform-with-azure-stack-hub-creating-a-vm-with-multiple-data-disks
# https://learn.microsoft.com/en-us/azure/virtual-machines/linux/quick-create-terraform?tabs=azure-cli

resource "azurerm_capacity_reservation_group" "reservation-group" {
  name                = "capacity-reservation-group"
  resource_group_name = azurerm_resource_group.personalcloud.name
  location            = azurerm_resource_group.personalcloud.location
}

resource "azurerm_capacity_reservation" "vm-reservation" {
  name                          = "vm-capacity-reservation"
  capacity_reservation_group_id = azurerm_capacity_reservation_group.reservation-group.id
  sku {
    name     = "Standard_B2pts_v2"
    capacity = 1
  }
}

resource "azurerm_virtual_network" "app" {
  name                = "pluto"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name
  address_space       = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "app" {
  name                 = "pluto"
  resource_group_name  = azurerm_resource_group.personalcloud.name
  virtual_network_name = azurerm_virtual_network.app.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "lb" {
  name                = "pluto-lb-pip"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name
  allocation_method   = "Dynamic"
  # sku                 = "Standard"
}

# resource "azurerm_lb" "pluto" {
#   name                = "pluto-lb"
#   location            = azurerm_resource_group.personalcloud.location
#   resource_group_name = azurerm_resource_group.personalcloud.name
#   sku                 = "Standard"

#   frontend_ip_configuration {
#     name                 = "PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.lb.id
#   }
# }

# resource "azurerm_lb_backend_address_pool" "pluto" {
#   name                = "pluto-bepool"
#   loadbalancer_id     = azurerm_lb.pluto.id
#   resource_group_name = azurerm_resource_group.personalcloud.name
# }

resource "azurerm_network_interface" "app" {
  name                = "pluto-nic"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name

  ip_configuration {
    name                          = "pluto-ipv4"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.lb.id
  }
}

resource "azurerm_managed_disk" "disk" {
  name                 = "datadisk_pluto"
  location             = azurerm_resource_group.personalcloud.location
  resource_group_name  = azurerm_resource_group.personalcloud.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "20"
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_linux_virtual_machine.pluto.id
  lun                = "10"
  caching            = "ReadWrite"
}

resource "azurerm_network_security_group" "nsg" {
  name                = "VM-NSG"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name

  security_rule {
    name                       = "ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "https"
    priority                   = 102
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "nsg-association" {
  network_interface_id      = azurerm_network_interface.app.id
  network_security_group_id = azurerm_network_security_group.nsg.id
}

resource "azurerm_linux_virtual_machine" "pluto" {
  name                = "pluto"
  resource_group_name = azurerm_resource_group.personalcloud.name
  location            = azurerm_resource_group.personalcloud.location
  size                = "Standard_B2pts_v2"
  admin_username      = "apollo"
  admin_password      = var.admin_password
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.app.id,
  ]
  capacity_reservation_group_id = azurerm_capacity_reservation_group.reservation-group.id

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server-arm64"
    version   = "latest"
  }
}
