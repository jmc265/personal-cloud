resource "azurerm_storage_container" "em_wedding" {
  name                  = "${var.short_prefix}-emwedding"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "parents_backup" {
  name                  = "${var.short_prefix}-parentsbackup"
  storage_account_name  = azurerm_storage_account.storage.name
  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "jcx-jupiter-backup" {
  name                  = "${var.short_prefix}-jupiter-backup"
  storage_account_name  = azurerm_storage_account.backup.name
  container_access_type = "private"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_management_policy" "em_wedding_policy" {
  storage_account_id = azurerm_storage_account.storage.id

  rule {
    name    = "${var.short_prefix}emweddingarchive"
    enabled = true
    filters {
      prefix_match = ["${azurerm_storage_container.em_wedding.name}/"]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_archive_after_days_since_modification_greater_than = 1
      }
    }
  }
  rule {
    name    = "${var.short_prefix}parentsbackuparchive"
    enabled = true
    filters {
      prefix_match = ["${azurerm_storage_container.parents_backup.name}/"]
      blob_types   = ["blockBlob"]
    }
    actions {
      base_blob {
        tier_to_archive_after_days_since_modification_greater_than = 1
      }
    }
  }
}
