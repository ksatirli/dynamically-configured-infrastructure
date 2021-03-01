# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys
data "consul_keys" "agent_count" {
  key {
    name    = "count"
    path    = "cluster-configuration/agents_count"
    default = "1"
  }
}

# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/resources/keys
resource "consul_keys" "aks_cluster" {
  key {
    # set AKS cluster name as value (by parsing `kube_config_raw` as YAML)
    # note: this is decidedly NOT a best-practice!
    path = "cluster-data/aks_name"
    value = yamldecode(module.aks.kube_config_raw).clusters[0].name
  }
}
