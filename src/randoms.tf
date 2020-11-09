resource "random_string" "storage_account" {
  length  = 20
  special = false
  upper   = false
  number  = false
}