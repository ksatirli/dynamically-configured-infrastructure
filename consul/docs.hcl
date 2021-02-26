# this container will be reachable via `consul.docs.shipyard.run`
docs "consul" {
  depends_on = [
    "container.consul",
  ]

  network {
    name = "network.demos"
  }

  path            = "./docs"
  port            = 18500
  open_in_browser = true

  index_title = "Consul"

  index_pages = [
    "index",
  ]
}
