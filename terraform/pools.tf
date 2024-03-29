resource "azurerm_synapse_spark_pool" "spark_pool" {

    name = "sparkpool"
    synapse_workspace_id = azurerm_synapse_workspace.workspace.id

    node_size_family     = "MemoryOptimized"
    node_size            = "Small"
    cache_size           = 100

    node_count           = 3

}