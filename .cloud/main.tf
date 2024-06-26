terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "james-cx"

    workspaces {
      name = "personal-cloud"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
    google = {
      source = "hashicorp/google"
      version = ">= 4.21.0"
    }
    newrelic = {
      source  = "newrelic/newrelic"
      version = "~> 3.14"
    }
  }

  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
  client_id       = var.azure_client_id
  client_secret   = var.azure_client_secret
  tenant_id       = var.azure_tenant_id
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  zone    = "${var.gcp_region}-b"
}

provider "newrelic" {
  account_id = var.newrelic_account_id
  api_key    = var.newrelic_api_key
  region     = "EU"
}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "personalcloud" {
  name     = "james-cx-personalcloud"
  location = "uksouth"
}

data  "azurerm_resource_group" "jeeb-uk" {
  name = "jeeb-uk"
}
