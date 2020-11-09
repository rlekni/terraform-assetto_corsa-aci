resource "azurerm_resource_group" "acserver" {
  name     = "${var.purpose}-${var.location}"
  location = var.location

  tags = local.tags
}