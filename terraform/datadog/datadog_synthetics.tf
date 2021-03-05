# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/synthetics_test
resource "datadog_synthetics_test" "beacon" {
  type = "browser"

  request_definition {
    method = "GET"
    url    = "http://${local.app_host}:${local.app_port}"
  }

  device_ids = [
    "laptop_large",
    "tablet"
  ]

  locations = [
    "aws:eu-central-1",
    "aws:eu-west-1",
    "aws:eu-west-2"
  ]

  options_list {
    tick_every = 300
  }

  name    = "A Browser test on ${local.app_host}:${local.app_port}"
  message = "Notify @pagerduty-qa"
  message = "Notify @phrawzty"

  status = "live"
}
