# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/resources/cluster
resource "hcs_cluster" "primary" {
  resource_group_name      = data.azurerm_resource_group.platform.name
  managed_application_name = "${data.azurerm_resource_group.platform.name}-consul-primary"
  email                    = "community@hashicorp.com"
  cluster_mode             = "production"
  min_consul_version       = data.hcs_consul_versions.default.recommended
  vnet_cidr                = "172.25.16.0/24"
  consul_datacenter        = "dc1"
}
