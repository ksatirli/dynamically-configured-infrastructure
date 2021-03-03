exec_remote "consul_hydrater" {
  depends_on = [
    "container.consul",
  ]

  network {
    name = "network.demos"
  }

  image {
    name = var.consul_image
  }

  cmd = "/scripts/insert_data.sh"

  working_directory = "/scripts"

  env {
    key   = "CONSUL_HTTP_ADDR"
    value = "http://consul.container.shipyard.run:8500"
  }

  volume {
    source      = "./scripts/"
    destination = "/scripts"
  }
}
