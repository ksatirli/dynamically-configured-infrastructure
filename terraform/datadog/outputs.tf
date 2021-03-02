locals {
  datadog_base = "https://app.datadoghq.com"
}

output "integrations" {
  description = "Integrations"
  value       = "${local.datadog_base}/account/settings#integrations"
}

output "infrastructure" {
  description = "Infrastructure"
  value       = "${local.datadog_base}/infrastructure"
}

output "k8s_services" {
  description = "K8s Services"
  value       = "${local.datadog_base}/orchestration/overview/service"
}

output "synthetics" {
  description = "Synthetics"
  value       = "${local.datadog_base}/synthetics/details/${datadog_synthetics_test.beacon.id}"
}

output "beacon_url" {
  description = "Beacon"
  value       = "http://${local.app_host}:${local.app_port}"
}
