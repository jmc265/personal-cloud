# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine
# https://nevaluoto.fi/posts/deploying-linux-vm-on-azure-using-terraform/
# https://www.cryingcloud.com/blog/2024/7/15/terraform-with-azure-stack-hub-creating-a-vm-with-multiple-data-disks

module "container-server-2" {
  source  = "christippett/container-server/cloudinit"
  version = "~> 1.2"

  domain = "pluto2.${var.root_domain}"
  email  = var.email_address

  files = [
    {
      filename = "docker-compose.yaml"
      content  = filebase64("${path.module}/../pluto/docker-compose.yaml")
    }
  ]
  env = {
    TRAEFIK_API_DASHBOARD = false
    DOCKER_APP_DATA       = "/run/app"
    ADMIN_EMAIL           = var.email_address
    ADMIN_PASSWORD        = var.admin_password
    INET_DOMAIN           = "pluto.${var.root_domain}"
    NRIA_LICENSE_KEY      = var.newrelic_license_key
  }

  # extra cloud-init config provided to setup + format persistent disk
  cloudinit_part = [{
    content_type = "text/cloud-config"
    content      = local.cloudinit_disk
  }]
}

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

resource "azurerm_network_interface" "app" {
  name                = "pluto-nic"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name

  ip_configuration {
    name                          = "pluto"
    subnet_id                     = azurerm_subnet.app.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app.id
  }
}

resource "azurerm_public_ip" "app" {
  name                = "pluto-vmpubip"
  location            = azurerm_resource_group.personalcloud.location
  resource_group_name = azurerm_resource_group.personalcloud.name
  allocation_method   = "Static"
  domain_name_label   = "pluto"
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
  address_prefixes = ["10.0.2.0/24"]
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

resource "azurerm_linux_virtual_machine" "pluto" {
  name                = "pluto"
  resource_group_name = azurerm_resource_group.personalcloud.name
  location            = azurerm_resource_group.personalcloud.location
  size                = "Standard_B2pts_v2"
  admin_username      = "apollo"
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.app.id,
  ]
  capacity_reservation_group_id = azurerm_capacity_reservation_group.reservation-group.id

  custom_data = base64encode(module.container-server-2.cloud_config)

  # admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}