# statically defined thresholds
#locals {
#  critical_threshold = 0.75
#  recovery_threshold = 0.66
#  warning_threshold  = 0
#}

# dynamically defined thresholds
locals {
  thresholds         = jsondecode(data.consul_keys.remote.var.datadog_thresholds)
  critical_threshold = tonumber(local.thresholds.critical)
  recovery_threshold = tonumber(local.thresholds.recover)
  warning_threshold  = tonumber(local.thresholds.warning)
}

# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/monitor
resource "datadog_monitor" "apm_store_frontend_anomalous_p90_latency" {
  name               = "Service store-frontend has an anomalous p90 latency on ruby-shop"
  type               = "query alert"
  message            = "Service store-fronted has an anomalous p90 latency on ruby-shop."
  escalation_message = "Service store-fronted has an anomalous p90 latency on ruby-shop!"

  query = "avg(last_1h):anomalies(avg:trace.rack.request.duration.by.service.90p{service:store-frontend,env:ruby-shop}, 'basic', 2, direction='above', interval=20) >= ${local.critical_threshold}"

  monitor_thresholds {
    critical          = local.critical_threshold
    critical_recovery = local.recovery_threshold
    warning           = local.warning_threshold
  }

  monitor_threshold_windows {
    recovery_window = "last_10m"
    trigger_window  = "last_5m"
  }

  notify_no_data    = false
  renotify_interval = 0

  notify_audit = false
  timeout_h    = 0
  include_tags = true

  tags = [
    "service:store-frontend",
    "env:ruby-shop"
  ]
}

resource "datadog_monitor" "apm_service_high_error_rate" {
  for_each           = var.services
  name               = "Service ${each.key} has a high error rate on ${each.value.environment}"
  type               = "query alert"
  message            = "Service ${each.key} has a high error rate. @pagerduty-${each.key}"
  escalation_message = "Service ${each.key} has a high error rate! @pagerduty-${each.key}"

  query = "avg(last_10m):(sum:trace.${each.value.framework}.request.errors{env:${each.value.environment},service:${each.key} } / sum:trace.${each.value.framework}.request.hits{env:${each.value.environment},service:${each.key} }) * 100 > ${each.value.high_error_rate_critical}"

  monitor_thresholds {
    warning  = each.value.high_error_rate_warning
    critical = each.value.high_error_rate_critical
  }

  notify_no_data    = false
  renotify_interval = 0

  notify_audit = false
  timeout_h    = 0
  include_tags = true

  tags = [
    "service:${each.key}",
    "env:${each.value.environment}"
  ]
}

resource "datadog_monitor" "apm_service_high_avg_latency" {
  for_each           = var.services
  name               = "Service ${each.key} has a high average latency on ${each.value.environment}"
  type               = "query alert"
  message            = "Service ${each.key} has a high average latency. @pagerduty-${each.key}"
  escalation_message = "Service ${each.key} has a high average latency!! @pagerduty-${each.key}"

  query = "avg(last_10m):sum:trace.${each.value.framework}.request.duration{env:${each.value.environment},service:${each.key}} / sum:trace.flask.request.hits{env:${each.value.environment},service:${each.key}} > ${each.value.high_avg_latency_critical}"

  monitor_thresholds {
    warning  = each.value.high_avg_latency_warning
    critical = each.value.high_avg_latency_critical
  }

  notify_no_data    = false
  renotify_interval = 0

  notify_audit = false
  timeout_h    = 0
  include_tags = true

  tags = [
    "service:${each.key}",
    "env:${each.value.environment}"
  ]
}

resource "datadog_monitor" "apm_service_high_p90_latency" {
  for_each           = var.services
  name               = "Service ${each.key} has a high p90 latency on ${each.value.environment}"
  type               = "query alert"
  message            = "Service ${each.key} has a high p90 latency. @pagerduty-${each.key}"
  escalation_message = "Service ${each.key} has a high p90 latency!! @pagerduty-${each.key}"

  query = "avg(last_10m):trace.${each.value.framework}.request.duration.by.service.90p{service:${each.key},env:${each.value.environment}} > ${each.value.high_p90_latency_critical}"

  monitor_thresholds {
    warning  = each.value.high_p90_latency_warning
    critical = each.value.high_p90_latency_critical
  }

  notify_no_data    = false
  renotify_interval = 0

  notify_audit = false
  timeout_h    = 0
  include_tags = true

  tags = [
    "service:${each.key}",
    "env:${each.value.environment}"
  ]
}
