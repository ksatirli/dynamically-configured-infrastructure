provider "consul" {
  address    = var.consul_address
  scheme     = var.consul_scheme
  datacenter = var.consul_datacenter
}
