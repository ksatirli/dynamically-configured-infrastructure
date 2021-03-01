# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys
data "consul_keys" "agent_count" {
  key {
    name = "aks_id"
    path = "cluster-data/aks_id"
  }
}
