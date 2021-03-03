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
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/kubernetes_cluster
data "azurerm_kubernetes_cluster" "current" {
  name                = data.consul_keys.remote.var.aks_name
  resource_group_name = data.consul_keys.remote.var.aks_resource_group
}

locals {
  # define a shorthand for better readability in `kubernetes.tf`
  kube_config = data.azurerm_kubernetes_cluster.current.kube_config[0]
}
