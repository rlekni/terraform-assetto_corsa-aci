resource "azurerm_container_group" "acserver" {
  name                = "acserver"
  location            = azurerm_resource_group.acserver.location
  resource_group_name = azurerm_resource_group.acserver.name
  ip_address_type     = "public"
  # dns_name_label      = "aci-label"
  os_type        = "Linux"
  restart_policy = "Always"

  container {
    name   = "acserver"
    image  = "seejy/assetto-server-manager:latest"
    cpu    = var.container_resources.cpu
    memory = var.container_resources.memory

    ports {
      port     = 80
      protocol = "TCP"
    }

    ports {
      port     = 8772
      protocol = "TCP"
    }

    ports {
      port     = 9600
      protocol = "TCP"
    }

    ports {
      port     = 9700
      protocol = "UDP"
    }

    ports {
      port     = 8081
      protocol = "TCP"
    }

    volume {
      name                 = "config"
      mount_path           = "/home/assetto/server-manager/"
      storage_account_name = azurerm_storage_account.acserver_store.name
      storage_account_key  = azurerm_storage_account.acserver_store.primary_access_key
      share_name           = azurerm_storage_share.config.name
    }

    volume {
      name                 = "assetto"
      mount_path           = "/home/assetto/server-manager/assetto/"
      storage_account_name = azurerm_storage_account.acserver_store.name
      storage_account_key  = azurerm_storage_account.acserver_store.primary_access_key
      share_name           = azurerm_storage_share.acserver.name
    }
  }

  tags = local.tags
}