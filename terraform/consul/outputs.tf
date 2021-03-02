output "cluster_name" {
  description = "HCS Cluster name"
  value       = hcs_cluster.primary.managed_application_name
}

output "cluster_version" {
  description = "HCS Cluster Consul version"
  value       = hcs_cluster.primary.consul_version
}

output "cluster_link" {
  description = "HCS Cluster Consul version"
  value       = "${local.portal_prefix}${hcs_cluster.primary.id}"
}

output "cluster_ui" {
  description = "HCS Cluster Consul version"
  value       = hcs_cluster.primary.consul_external_endpoint_url
}

output "cluster_root_token" {
  description = "The secret ID of the root ACL token that is generated upon cluster creation."
  value       = "use `terraform console` to query the value of `hcs_cluster.primary.consul_root_token_secret_id`"
}
