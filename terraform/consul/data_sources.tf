# see https://www.terraform.io/docs/language/state/remote-state-data.html
data "terraform_remote_state" "upstream" {
  backend = "remote"

  config = {
    organization = "a-demo-organization"
    workspaces = {
      name = "dci-azure"
    }
  }
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group
data "azurerm_resource_group" "platform" {
  name = data.terraform_remote_state.upstream.outputs.resource_group_name
}

# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/data-sources/plan_defaults
data "hcs_plan_defaults" "default" {}

# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/data-sources/consul_versions
data "hcs_consul_versions" "default" {}
