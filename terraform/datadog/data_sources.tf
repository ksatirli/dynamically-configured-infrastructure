# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys
data "consul_keys" "remote" {
  key {
    name = "aks_name"
    path = "cluster-data/aks_name"
  }

  key {
    name = "aks_resource_group"
    path = "cluster-data/aks_resource_group"
  }

  key {
    name = "aks_tags"
    path = "cluster-data/aks_tags"
  }

  key {
    name = "datadog_thresholds"
    path = "datadog/thresholds"
  }
}

# assemble host filters for Datadog
locals {
  host_filter_tag_app = jsondecode(data.consul_keys.remote.var.aks_tags).application
  host_filter_tag_env = jsondecode(data.consul_keys.remote.var.aks_tags).environment
  host_filters        = "environment:${local.host_filter_tag_env},app:${local.host_filter_tag_app}"
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config
data "azurerm_client_config" "current" {}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription
data "azurerm_subscription" "current" {}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster
data "azurerm_kubernetes_cluster" "current" {
  name                = data.consul_keys.remote.var.aks_name
  resource_group_name = data.consul_keys.remote.var.aks_resource_group
}

locals {
  # define a shorthand for better readability in `kubernetes.tf`
  kube_config = data.azurerm_kubernetes_cluster.current.kube_config[0]
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/service
data "kubernetes_service" "beacon" {
  metadata {
    name      = "beacon"
    namespace = "beacon"
  }
}

locals {
  app_host = data.kubernetes_service.beacon.status[0].load_balancer[0].ingress[0].ip
  app_port = data.kubernetes_service.beacon.spec[0].port[0].port
}

output "beacon_url" {
  description = "Beacon"
  value       = "http://${local.app_host}:${local.app_port}"
}
