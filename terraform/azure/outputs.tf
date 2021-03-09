output "resource_group_name" {
  description = "Resource Group Name"
  value       = azurerm_resource_group.platform.name
}

output "resource_group_url" {
  description = "Resource Group URL"
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
