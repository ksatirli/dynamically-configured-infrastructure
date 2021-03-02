# see https://registry.terraform.io/providers/hashicorp/consul/2.11.0
provider "consul" {
  address    = var.consul_address
  datacenter = var.consul_datacenter
}
