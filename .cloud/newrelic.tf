resource "newrelic_cloud_azure_link_account" "nr_account_link"{
  account_id      = var.newrelic_account_id
  application_id  = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
  name            = "${var.short_prefix}linknr"
}