variable "consul_address" {
  type        = string
  description = "The HTTP(S) API address of the agent to use."
  default     = "http://consul.container.shipyard.run:8500"
}

variable "consul_datacenter" {
  type        = string
  description = "The datacenter to use."
  default     = "dc1"
}

variable "datadog_api_key" {
  type        = string
  description = "Datadog API Key"
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog Application Key"
}

variable "azuread_application_id" {
  type        = string
  description = "AzureAD Application ID for Datadog application"
}

variable "azuread_application_consent_desc" {
  type        = string
  description = "Consent Description"
  default     = "Allow the application to access Datadog on behalf of the signed-in user."
}
