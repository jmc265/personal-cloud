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

# resource "azurerm_dns_aaaa_record" "pluto" {
#   name                = "pluto"
#   zone_name           = data.azurerm_dns_zone.root.name
#   resource_group_name = data.azurerm_resource_group.jeeb-uk.name
#   ttl                 = 300
#   records             = [azurerm_public_ip.app.ip_address]
# }

resource "azurerm_dns_a_record" "pluto" {
  name                = "pluto"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  target_resource_id = azurerm_public_ip.lb.id
}

# resource "azurerm_dns_cname_record" "pluto" {
#   name                = "pluto"
#   zone_name           = data.azurerm_dns_zone.root.name
#   resource_group_name = data.azurerm_resource_group.jeeb-uk.name
#   ttl                 = 300
#   # record              = azurerm_public_ip.lb.fqdn
#   # target_resource_id = azurerm_public_ip.lb.id
# }

resource "azurerm_dns_cname_record" "pluto_wildcard" {
  name                = "*.pluto"
  zone_name           = data.azurerm_dns_zone.root.name
  resource_group_name = data.azurerm_resource_group.jeeb-uk.name
  ttl                 = 300
  record              = azurerm_dns_a_record.pluto.fqdn
}