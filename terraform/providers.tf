provider "azurerm"{
   features{
    resource_group {
        purge_soft_delete_on_destroy = true
    }
   } 
}