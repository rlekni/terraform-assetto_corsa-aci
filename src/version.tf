terraform {
  required_version = "~> 0.13"
}

provider "azurerm" {
  version = "~> 2.35.0"
  features {}
}

provider "random" {
  version = "~> 3.0.0"
}