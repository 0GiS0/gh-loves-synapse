resource "azurerm_role_assignment" "role_assignment" {
  scope                = azurerm_synapse_workspace.workspace.id
  role_definition_name = "Contributor"
  principal_id         = data.azurerm_client_config.current.object_id  
}