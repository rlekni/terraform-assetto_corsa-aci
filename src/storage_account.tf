resource "azurerm_storage_account" "acserver_store" {
  name                     = random_string.storage_account.result
  resource_group_name      = azurerm_resource_group.acserver.name
  location                 = azurerm_resource_group.acserver.location
  account_tier             = "Standard" # Standard=HDD, Premium=SSD
  account_replication_type = "LRS"

  tags = local.tags
}

# We use a seperate file share to mount config volume, to persist assetto-corsa server manager config and database.
resource "azurerm_storage_share" "config" {
  name                 = "config"
  storage_account_name = azurerm_storage_account.acserver_store.name
  quota                = 10
}

# We use seperate file share to store all server files including content.
resource "azurerm_storage_share" "acserver" {
  name                 = "acserver"
  storage_account_name = azurerm_storage_account.acserver_store.name
  quota                = 50 # If using Premium storage account should set this higher than 100
}
