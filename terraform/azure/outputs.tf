output "resource_group_url" {
  description = "Resource Group"
  value       = "${local.portal_prefix}${azurerm_resource_group.platform.id}${local.portal_suffix}"
}

output "cluster_url" {
  description = "Kubernetes Service"
  value       = "${local.portal_prefix}${module.aks.aks_id}${local.portal_suffix}"
}

output "cluster_node_pools_url" {
  description = "Node Pools"
  value       = "${local.portal_prefix}${module.aks.aks_id}/nodePools"
}
