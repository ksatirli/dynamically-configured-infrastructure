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

variable "region" {
  type        = string
  description = "Azure Region to create resource(s) in"
  default     = "West Europe"
}

locals {
  portal_prefix = "https://portal.azure.com/#@azure.hashicorptest.com/resource"
  portal_suffix = "/overview"
}