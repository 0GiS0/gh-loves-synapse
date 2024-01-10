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

resource "azurerm_synapse_workspace" "workspace" {
  name                                 = "example"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "H@Sh1CoR3!"  

  identity {
    type = "SystemAssigned"
  }  
}

data "http" "current_public_ip" {
  url = "https://ipinfo.io/ip"
}

# firewall rules
resource "azurerm_synapse_firewall_rule" "allow_all" {
  name                = "allow_from_home"
  synapse_workspace_id = azurerm_synapse_workspace.workspace.id  
  start_ip_address    = data.http.current_public_ip.body
    end_ip_address      = data.http.current_public_ip.body
}