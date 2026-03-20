provider "azurerm" {
  features {}
}

module "sentinel" {
  source = "../../"
}
