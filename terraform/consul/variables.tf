variable "hcs_cluster_cluster_mode" {
  type        = string
  description = "The mode of the cluster."
  default     = "production"
}

variable "hcs_cluster_email" {
  type        = string
  description = "The contact email for the primary owner of the cluster."
}

variable "hcs_cluster_name_suffix" {
  type        = string
  description = "The name of the HCS Azure Managed Application."
}

variable "hcs_cluster_consul_external_endpoint" {
  type        = bool
  description = "Denotes that the cluster has an external endpoint for the Consul UI."
  default     = false
}

locals {
  portal_prefix = "https://portal.azure.com/#@azure.hashicorptest.com/resource"
}
