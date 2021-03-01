# Please note: this resource is disabled here because of a pre-existing Datadog configuration.
# For your own organization, you will likely want to create the Datadog application as follows:
# see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application
resource "azuread_application" "datadog" {
  display_name               = "Datadog"
  homepage                   = "https://app.datadoghq.com"
  identifier_uris            = ["https://app.datadoghq.eu"]
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false

  oauth2_permissions {
    admin_consent_description  = var.azuread_application_consent_desc
    admin_consent_display_name = "Datadog"
    is_enabled                 = true
    type                       = "User"
    user_consent_description   = var.azuread_application_consent_desc
    user_consent_display_name  = "Access Datadog"
    value                      = "user_impersonation"
  }
}

# see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/application
data "azuread_application" "datadog" {
  application_id = var.azuread_application_id
}

# see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal
resource "azuread_service_principal" "datadog" {
  application_id               = azuread_application.datadog.application_id
  app_role_assignment_required = false
}

# see https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal_password
resource "azuread_service_principal_password" "datadog" {
  service_principal_id = azuread_service_principal.datadog.id
  value                = random_password.datadog.result
  end_date             = "2021-12-31T00:00:00Z"
}

# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment
# and also see https://docs.datadoghq.com/integrations/azure/?tab=azurecliv20
resource "azurerm_role_assignment" "monitoring_reader" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Monitoring Reader"
  principal_id         = azuread_service_principal.datadog.id
}
