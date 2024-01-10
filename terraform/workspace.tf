resource "azurerm_resource_group" "rg" {
  name     = "${var.env_prefix}-synapse-rg"
  location = var.location
}

resource "azurerm_synapse_workspace" "workspace" {
  name                                 = "${var.env_prefix}-synapse-wkspc"
  resource_group_name                  = azurerm_resource_group.rg.name
  location                             = azurerm_resource_group.rg.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_data_lake_gen2_filesystem.filesystem.id
  sql_administrator_login              = var.sql_administrator_login
  sql_administrator_login_password     = var.sql_administrator_login_password

  identity {
    type = "SystemAssigned"
  }
}

data "http" "current_public_ip" {
  url = "https://ipinfo.io/ip"
}

# firewall rules
resource "azurerm_synapse_firewall_rule" "allow_all" {
  name                 = "allow_from_home"
  synapse_workspace_id = azurerm_synapse_workspace.workspace.id
  start_ip_address     = data.http.current_public_ip.response_body
  end_ip_address       = data.http.current_public_ip.response_body
}
