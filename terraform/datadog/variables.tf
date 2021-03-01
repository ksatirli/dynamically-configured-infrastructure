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

locals {
  portal_prefix = "https://portal.azure.com/#@azure.hashicorptest.com/resource"
  portal_suffix = "/overview"
}
