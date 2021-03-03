# see https://registry.terraform.io/providers/hashicorp/hcs/latest/docs/resources/cluster
resource "hcs_cluster" "primary" {
  resource_group_name      = data.azurerm_resource_group.platform.name
  managed_application_name = "${data.azurerm_resource_group.platform.name}-${var.hcs_cluster_name_suffix}"
  email                    = var.hcs_cluster_email
  cluster_mode             = var.hcs_cluster_cluster_mode
  min_consul_version       = data.hcs_consul_versions.default.recommended
  consul_external_endpoint = var.hcs_cluster_consul_external_endpoint
}
