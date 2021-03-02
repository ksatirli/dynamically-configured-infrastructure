variable "consul_address" {
  type        = string
  description = "The HTTP(S) API address of the agent to use."
  default     = "http://consul.container.shipyard.run:8500"
}

variable "consul_scheme" {
  type        = string
  description = "The URL scheme of the agent to use"
  default     = "http"
}

variable "consul_datacenter" {
  type        = string
  description = "The datacenter to use."
  default     = "dc1"
}

variable "app_name" {
  type        = string
  description = "Application name"
  default     = "beacon"
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

variable "services" {
  type = map(object({
    pd_service_key            = string,
    environment               = string,
    framework                 = string,
    high_error_rate_warning   = number,
    high_error_rate_critical  = number,
    high_avg_latency_warning  = number,
    high_avg_latency_critical = number,
    high_p90_latency_warning  = number,
    high_p90_latency_critical = number,
  }))
  description = "Services and query alert thresholds"
}
