output "resource_group_link" {
  description = "Resource Group"
  value       = "${local.portal_prefix}${azurerm_resource_group.platform.id}${local.portal_suffix}"
}

output "aks_link" {
  description = "Kubernetes Service"
  value       = "${local.portal_prefix}${module.aks.aks_id}${local.portal_suffix}"
}

output "node_pools_link" {
  description = "Node Pools"
  value       = "${local.portal_prefix}${module.aks.aks_id}/nodePools"
}
