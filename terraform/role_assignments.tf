#resource "azurerm_synapse_role_assignment" "sp_role_assigment" {
#  synapse_workspace_id = azurerm_synapse_workspace.workspace.id
#  role_name            = "Synapse Administrator"
#  principal_id         = data.azurerm_client_config.current.object_id

#  depends_on = [azurerm_synapse_firewall_rule.allow_all]
#}

resource "azurerm_synapse_role_assignment" "user_role_assigment" {
    synapse_workspace_id = azurerm_synapse_workspace.workspace.id
    role_name            = "Synapse Administrator"
    principal_id         = var.user_object_id

    principal_type = "User"
    
    depends_on = [azurerm_synapse_firewall_rule.allow_all]
}
