provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

module "resource_group" {
  source      = "terraform-az-modules/resource-group/azurerm"
  version     = "1.0.3"
  name        = "core"
  environment = "dev"
  location    = "centralus"
  label_order = ["name", "environment", "location"]
}

# ------------------------------------------------------------------------------
# Log Analytics
# ------------------------------------------------------------------------------
module "log-analytics" {
  source                      = "terraform-az-modules/log-analytics/azurerm"
  version                     = "1.0.2"
  name                        = "core"
  environment                 = "dev"
  label_order                 = ["name", "environment", "location"]
  log_analytics_workspace_sku = "PerGB2018"
  resource_group_name         = module.resource_group.resource_group_name
  location                    = module.resource_group.resource_group_location
}

module "sentinel" {
  depends_on                 = [module.log-analytics]
  source                     = "../../"
  name                       = "core"
  environment                = "dev"
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  resource_group_name        = module.resource_group.resource_group_name
  subscription_id            = data.azurerm_client_config.current.subscription_id
  log_analytics_workspace_id = module.log-analytics.workspace_id
}
