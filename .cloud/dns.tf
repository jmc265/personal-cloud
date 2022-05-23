resource "azurerm_dns_zone" "root" {
  name                = var.root_domain
  resource_group_name = azurerm_resource_group.personalcloud.name
}

# This will act as my DDNS record
resource "azurerm_dns_a_record" "home" {
  name                = "home"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  records             = ["1.2.3.4"] # Updated by script
}

resource "azurerm_dns_cname_record" "photoprism" {
  name                = "photos"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "syncthing" {
  name                = "sync"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "homeassistant" {
  name                = "homeassistant"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "recipes" {
  name                = "recipes"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "media" {
  name                = "media"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "cloud" {
  name                = "cloud"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "start" {
  name                = "start"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_cname_record" "healthchecks" {
  name                = "healthchecks"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.home.fqdn
}

resource "azurerm_dns_aaaa_record" "pluto" {
  name                = "pluto"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  records             = [google_compute_instance.pluto.network_interface.0.ipv6_access_config.0.external_ipv6]
}


output "name_servers" {
  value = azurerm_dns_zone.root.name_servers
}