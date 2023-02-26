resource "newrelic_cloud_azure_link_account" "nr_account_link"{
  name            = "${var.short_prefix}linknr"
  account_id      = var.newrelic_account_id
  application_id  = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

resource "newrelic_cloud_azure_integrations" "foo" {
    account_id        = var.NEW_RELIC_ACCOUNT_ID
    linked_account_id = newrelic_cloud_azure_link_account.newrelic_cloud_azure_integration.id

    cost_management {}
    front_door {}
    key_vault {}
    storage {}
}