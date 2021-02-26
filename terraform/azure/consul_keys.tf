# see https://registry.terraform.io/providers/hashicorp/consul/latest/docs/data-sources/keys
data "consul_keys" "agent_count" {
  key {
    name    = "count"
    path    = "cluster-configuration/agents_count"
    default = "1"
  }
}
