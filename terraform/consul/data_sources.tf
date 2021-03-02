# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group
data "azurerm_resource_group" "platform" {
  name = "platform"
}

# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/data-sources/plan_defaults
data "hcs_plan_defaults" "default" {}

# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/data-sources/consul_versions
data "hcs_consul_versions" "default" {}
