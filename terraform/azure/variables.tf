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

variable "project_name" {
  type        = string
  description = "Project name (used globally)"
  default     = "dynamic-infrastructure"

  validation {
    # check the length of the string and ensure it does not contain spaces
    # see https://www.terraform.io/docs/language/values/variables.html#custom-validation-rules
    condition = (
      length(var.project_name) > 4 &&
      length(var.project_name) < 32 &&
      replace(var.project_name, " ", "") == var.project_name
    )

    error_message = "The project_name must be between 4 and 32 characters and may not contain spaces."
  }
}

variable "region" {
  type        = string
  description = "Azure Region to create resource(s) in"
  default     = "westeurope"
}

variable "tags" {
  type        = map(string)
  description = "Default Tags"
  default = {
    environment = "testing"
    application = "platform"
  }
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version to create cluster with"
  default     = "1.19.7"
}

locals {
  portal_prefix = "https://portal.azure.com/#@azure.hashicorptest.com/resource"
  portal_suffix = "/overview"
}
