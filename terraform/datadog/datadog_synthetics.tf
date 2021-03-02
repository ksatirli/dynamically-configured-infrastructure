# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test
resource "datadog_synthetics_test" "beacon" {
  type = "browser"

  request_definition {
    method = "GET"
    url    = "http://{local.app_host}:${local.app_port}"
  }

  device_ids = ["tablet"]
  locations  = ["aws:eu-central-1"]

  options_list {
    tick_every = 3600
  }

  name    = "A Browser test on {local.app_host}:${local.app_port}"
  message = "Notify @pagerduty-qa"

  status = "live"
}
