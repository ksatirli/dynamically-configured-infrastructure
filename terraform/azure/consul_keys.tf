data "consul_keys" "agent_count" {
  key {
    name    = "count"
    path    = "cluster-configuration/agents_count"
    default = "1"
  }
}
