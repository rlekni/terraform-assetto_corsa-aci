resource "random_string" "storage_account" {
  length  = 20
  special = false
  upper   = false
  number  = false
}

resource "random_string" "dns_label" {
  length  = 10
  special = false
  upper   = false
  number  = false
}