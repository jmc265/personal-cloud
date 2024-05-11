# resource "azurerm_dns_zone" "root" {
#   name                = var.root_domain
#   resource_group_name = data.azurerm_resource_group.personal-cloud.name
# }

data "azurerm_dns_zone" "root" {
  name                = var.root_domain
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
}

# This will act as my DDNS record
resource "azurerm_dns_a_record" "home" {
  name                = "home"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  records             = ["1.2.3.4"] # Updated by script
}

resource "azurerm_dns_cname_record" "home_wildcard" {
  name                = "*"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_a_record" "pluto" {
  name                = "pluto"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  records             = [google_compute_instance.pluto.network_interface.0.access_config.0.nat_ip]
}

resource "azurerm_dns_cname_record" "pluto_wildcard" {
  name                = "*.pluto"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  record              = azurerm_dns_a_record.pluto.fqdn
}
