bootstrap_expect = 1

bind_addr = "0.0.0.0"

check_update_interval = "3m"

client_addr = "0.0.0.0"

datacenter = "dc1"

data_dir = "/data/"

disable_http_unprintable_char_filter = false

disable_remote_exec = true

disable_update_check = true

log_level = "INFO"

primary_datacenter = "dc1"

ports {
  http = 8500
}

server = true

telemetry {
  disable_compat_1.9 = true
  disable_hostname   = true
  # dogstatsd_addr     = "datadog.container.shipyard.run:8125"
}

ui_config {
  enabled = true
}
