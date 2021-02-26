# this container will be reachable via `consul.container.shipyard.run`
container "consul" {
  network {
    name = "network.demos"
  }

  image {
    name = var.consul_image
  }

  command = [
    "consul",
    "agent",
    "-config-dir=/config",
  ]

  env {
    key   = "CONSUL_HTTP_ADDR"
    value = "http://localhost:8500"
  }

  volume {
    source      = "./config"
    destination = "/config"
  }

  volume {
    source      = data("/consul/data")
    destination = "/data"
  }

  volume {
    source      = "./scripts"
    destination = "/scripts"
  }

  # Consul port-mappings, see https://www.consul.io/docs/install/ports for more information
  # HTTP port
  port {
    local    = 8500
    remote   = 8500
    host     = 8500
    protocol = "tcp"
    open_in_browser = "/ui/dc1/kv"
  }

  privileged = false

  health_check {
    timeout = "30s"
    http    = "http://localhost:8500/v1/status/leader"
  }
}
