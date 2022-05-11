# https://docs.microsoft.com/en-us/azure/storage/blobs/network-file-system-protocol-support-how-to?tabs=azure-cli
# https://docs.microsoft.com/en-us/azure/storage/files/storage-how-to-use-files-linux?tabs=smb311
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_share

resource "azurerm_storage_account" "storage" {
  name                            = "${var.short_prefix}storage"
  resource_group_name             = azurerm_resource_group.personalcloud.name
  location                        = azurerm_resource_group.personalcloud.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  access_tier                     = "Cool"
  allow_nested_items_to_be_public = false

  blob_properties {
    delete_retention_policy {
      days = 365
    }
    container_delete_retention_policy {
      days = 365
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_account" "backup" {
  name                            = "${var.short_prefix}backup"
  resource_group_name             = azurerm_resource_group.personalcloud.name
  location                        = azurerm_resource_group.personalcloud.location
  account_tier                    = "Standard"
  account_replication_type        = "ZRS"
  access_tier                     = "Cool"
  allow_nested_items_to_be_public = false

  blob_properties {
    delete_retention_policy {
      days = 365
    }
    container_delete_retention_policy {
      days = 365
    }
  }

  lifecycle {
    prevent_destroy = true
  }
}
