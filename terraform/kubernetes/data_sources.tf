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

}
