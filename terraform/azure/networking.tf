# see https://registry.terraform.io/modules/Azure/network/azurerm/3.3.0
module "network" {
  source  = "Azure/network/azurerm"
  version = "3.3.0"

  resource_group_name = azurerm_resource_group.platform.name

  address_space   = "11.0.0.0/16"
  subnet_prefixes = ["11.0.1.0/24"]
  subnet_names    = ["subnet1"]

  tags = var.tags

  # see https://www.terraform.io/docs/language/meta-arguments/depends_on.html
  depends_on = [
    azurerm_resource_group.platform
  ]
}
