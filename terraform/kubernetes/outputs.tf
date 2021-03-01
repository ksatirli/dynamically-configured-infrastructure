locals {
  aks_link_base = "${local.portal_prefix}${data.azurerm_kubernetes_cluster.current.id}"
  app_host      = kubernetes_service.beacon.status[0].load_balancer[0].ingress[0].ip
  app_port      = kubernetes_service.beacon.spec[0].port[0].port
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

output "beacon_url" {
  description = "Beacon"
  value       = "http://${local.app_host}:${local.app_port}"
}
