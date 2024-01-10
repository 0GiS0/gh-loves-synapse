resource "random_id" "storage" {
  byte_length = 2
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.env_prefix}storage${random_id.storage.dec}"
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

# Upload a parquet file to the storage account
resource "azurerm_storage_blob" "file" {
  name                   = "green_tripdata_2023-01.parquet"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = azurerm_storage_data_lake_gen2_filesystem.filesystem.name
  type                   = "Block"
  source                 = "../data/green_tripdata_2023-01.parquet"
  depends_on             = [azurerm_storage_data_lake_gen2_filesystem.filesystem]
}
