# see https://registry.terraform.io/modules/Azure/aks/azurerm/4.8.0
module "aks" {
  source  = "Azure/aks/azurerm"
  version = "4.8.0"

  kubernetes_version   = var.cluster_version
  orchestrator_version = var.cluster_version
  resource_group_name  = azurerm_resource_group.platform.name
  prefix               = var.project_name

  # see http://consul.container.shipyard.run:8500/ui/dc1/kv/cluster-configuration/agents_count/edit
  agents_count    = data.consul_keys.agent_count.var.count
  vnet_subnet_id  = module.network.vnet_subnets[0]
  os_disk_size_gb = 100

  # see https://www.terraform.io/docs/language/meta-arguments/depends_on.html
  depends_on = [
    module.network
  ]
}
