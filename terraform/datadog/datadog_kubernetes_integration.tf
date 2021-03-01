# see https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release
resource "helm_release" "datadog_agent" {
  name = "datadog-agent"

  # see https://github.com/DataDog/helm-charts/tree/master/charts/datadog
  chart             = "datadog/datadog"
  version           = "2.9.5"
  dependency_update = true
  force_update      = true

  set_sensitive {
    name  = "datadog.apiKey"
    value = var.datadog_api_key
  }

  set_sensitive {
    name  = "datadog.appKey"
    value = var.datadog_app_key
  }

  set {
    name  = "datadog.collectEvents"
    value = true
  }

  set {
    name  = "datadog.logs.enabled"
    value = true
  }

  set {
    name  = "datadog.logs.containerCollectAll"
    value = false
  }

  set {
    name  = "datadog.logs.containerCollectUsingFiles"
    value = true
  }

  set {
    name  = "datadog.processAgent.enabled"
    value = true
  }

  set {
    name  = "datadog.processAgent.processCollection"
    value = false
  }

  set {
    name  = "datadog.systemProbe.enableTCPQueueLength"
    value = false
  }

  set {
    name  = "datadog.systemProbe.enableOOMKill"
    value = true
  }

  set {
    name  = "datadog.systemProbe.collectDNSStats"
    value = false
  }
}
