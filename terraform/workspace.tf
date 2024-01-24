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

  # only applies if env_prefix is equal to dev
  # if env_prefix is equal to dev, then we configure git integration

  
    # You must log in to the Synapse UI to complete the authentication to the GitHub Repository
  github_repo {
      account_name = var.github_account_name
      branch_name  = var.github_branch_name
      repository_name = var.github_repository_name
      root_folder = var.github_root_folder

  }
 



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
  start_ip_address     = var.home_ip != "" ? var.home_ip : data.http.current_public_ip.response_body
  end_ip_address       = var.home_ip != "" ? var.home_ip : data.http.current_public_ip.response_body
}
