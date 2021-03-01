resource "datadog_integration_azure" "platform" {
  tenant_name   = data.azurerm_client_config.current.tenant_id
  client_id     = data.azurerm_client_config.current.client_id
  client_secret = azuread_service_principal_password.datadog.value
  host_filters  = "environment:testing,app:platform"
}
