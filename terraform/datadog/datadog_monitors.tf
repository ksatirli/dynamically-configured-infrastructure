# statically defined thresholds
#locals {
#  critical_threshold = 0.75
#  recovery_threshold = 0.66
#  warning_threshold  = 0
#}

# dynamically defined thresholds
locals {
  thresholds = jsondecode(data.consul_keys.remote.var.datadog_thresholds)
  critical_threshold = tonumber(local.thresholds.critical)
  recovery_threshold = tonumber(local.thresholds.recover)
  warning_threshold  = tonumber(local.thresholds.warning)
}

