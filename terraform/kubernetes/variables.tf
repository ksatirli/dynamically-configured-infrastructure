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

variable "app_name" {
  type        = string
  description = "Application name"
  default     = "beacon"
}

variable "app_image" {
  type        = string
  description = "Application Image (incl. Tag)"
  default     = "onlydole/beacon:main"
}

locals {
  portal_prefix = "https://portal.azure.com/#@azure.hashicorptest.com/resource"
}
