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
      version = ">= 4.30.0"
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
}

data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "personalcloud" {
  name     = "james-cx-personalcloud"
  location = "uksouth"
}

data  "azurerm_resource_group" "jeeb-uk" {
  name = "jeeb-uk"
}
