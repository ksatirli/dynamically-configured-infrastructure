# see https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2
provider "kubernetes" {
  host                   = local.config.host
  client_certificate     = base64decode(local.config.client_certificate)
  client_key             = base64decode(local.config.client_certificate)
  cluster_ca_certificate = base64decode(local.config.cluster_ca_certificate)
}
