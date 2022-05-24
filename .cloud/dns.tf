resource "azurerm_dns_zone" "root" {
  name                = var.root_domain
  resource_group_name = azurerm_resource_group.personalcloud.name
}

# This will act as my DDNS record
resource "azurerm_dns_a_record" "jupiter" {
  name                = "jupiter"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  records             = ["1.2.3.4"] # Updated by script
}

resource "azurerm_dns_cname_record" "jupiter_wildcard" {
  name                = "*"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.jupiter.fqdn
}

resource "azurerm_dns_a_record" "pluto" {
  name                = "pluto"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  records             = [google_compute_instance.pluto.network_interface.0.access_config.0.nat_ip]
}

resource "azurerm_dns_cname_record" "pluto_wildcard" {
  name                = "*.pluto"
  zone_name           = azurerm_dns_zone.root.name
  resource_group_name = azurerm_resource_group.personalcloud.name
  ttl                 = 300
  record              = azurerm_dns_a_record.pluto.fqdn
}

output "name_servers" {
  value = azurerm_dns_zone.root.name_servers
}