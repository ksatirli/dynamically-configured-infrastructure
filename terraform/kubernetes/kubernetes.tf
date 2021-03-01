# see https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2
provider "kubernetes" {
  load_config_file = false

  host                   = local.kube_config.host
  client_certificate     = base64decode(local.kube_config.client_certificate)
  client_key             = base64decode(local.kube_config.client_certificate)
  cluster_ca_certificate = base64decode(local.kube_config.cluster_ca_certificate)
}
