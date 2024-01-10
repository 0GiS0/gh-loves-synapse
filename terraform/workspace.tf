resource "azurerm_resource_group" "rg" {
  name     = "${var.env_prefix}-synapse-rg"
  location = var.location
}