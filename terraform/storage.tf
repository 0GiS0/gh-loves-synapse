resource "azurerm_storage_account" "storage" {
  name                     = "${var.prefix}storage${random_id.storage.dec}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = "true"
}

resource "azurerm_storage_data_lake_gen2_filesystem" "filesystem" {
  name               = "users"
  storage_account_id = azurerm_storage_account.storage.id
}

