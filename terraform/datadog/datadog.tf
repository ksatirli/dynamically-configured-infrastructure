# see https://registry.terraform.io/providers/DataDog/datadog/2.21.0
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key

  # set this to `https://api.datadoghq.eu/` if you're working with the "EU" version of Datadog
  api_url = "https://api.datadoghq.com/"
}
