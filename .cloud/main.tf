terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "james-cx"

    workspaces {
      name = "home-server"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
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

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "personalcloud" {
  name     = "james-cx-personalcloud"
  location = "uksouth"
}
