# see https://registry.terraform.io/providers/DataDog/datadog/latest/docs/resources/integration_azure
resource "datadog_integration_azure" "platform" {
  tenant_name   = data.azurerm_client_config.current.tenant_id
  client_id     = azuread_application.datadog.application_id
  client_secret = azuread_service_principal_password.datadog.value
  host_filters  = "environment:testing,app:platform"
}
