# https://github.com/newrelic/terraform-provider-newrelic/blob/main/examples/cloud-integrations-azure.tf

resource "newrelic_cloud_azure_link_account" "nr_account_link"{
  name            = "${var.short_prefix}linknr"
  account_id      = var.newrelic_account_id
  application_id  = var.azure_client_id
  client_secret   = var.azure_client_secret
  subscription_id = var.azure_subscription_id
  tenant_id       = var.azure_tenant_id
}

resource "newrelic_cloud_azure_integrations" "foo" {
    account_id        = var.newrelic_account_id
    linked_account_id = newrelic_cloud_azure_link_account.nr_account_link.id

    cost_management {}
    front_door {}
    key_vault {}
    storage {}
}

resource "newrelic_cloud_gcp_link_account" "nr_account_link_gcp" {
  name = "${var.short_prefix}linkgcp"
  project_id=var.gcp_project_id
}

resource "newrelic_cloud_gcp_integrations" "foo1" {
  linked_account_id = newrelic_cloud_gcp_link_account.nr_account_link_gcp.id
  app_engine {
    metrics_polling_interval = 400
  }
  data_store {
    metrics_polling_interval = 400
  }
  run {
    metrics_polling_interval = 400
  }
  storage {
    metrics_polling_interval = 400
    fetch_tags=true
  }
  virtual_machines {
    metrics_polling_interval = 400
  }
  vpc_access {
    metrics_polling_interval = 400
  }
}