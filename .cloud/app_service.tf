resource "azurerm_service_plan" "app_service_plan" {
  name                = "${var.short_prefix}-app-service-plan"
  resource_group_name = azurerm_resource_group.personalcloud.name
  location            = azurerm_resource_group.personalcloud.location
  os_type             = "Linux"
  sku_name            = "FREE"
}

resource "azurerm_linux_web_app" "uptime_kuma" {
  name                = "${var.short_prefix}-uptime-kuma"
  resource_group_name = azurerm_resource_group.personalcloud.name
  location            = azurerm_resource_group.personalcloud.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  https_only = true

  site_config {
    always_on = true
    application_stack {
      docker_image = "registry.hub.docker.com/louislam/uptime-kuma"
    }
  }
}