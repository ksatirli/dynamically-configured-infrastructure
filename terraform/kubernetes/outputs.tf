locals {
  aks_link_base = "${local.portal_prefix}${data.azurerm_kubernetes_cluster.current.id}"
}

output "cluster_url" {
  description = "Cluster Index"
  value       = local.aks_link_base
}

output "cluster_namespaces_url" {
  description = "Cluster Namespaces"
  value       = "${local.aks_link_base}/namespaces"
}

output "cluster_workloads_url" {
  description = "Cluster Workloads"
  value       = "${local.aks_link_base}/workloads"
}

output "cluster_services_url" {
  description = "Cluster Services and Ingresses"
  value       = "${local.aks_link_base}/servicesAndIngresses"
}
