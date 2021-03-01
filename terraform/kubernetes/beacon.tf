resource "kubernetes_namespace" "beacon" {
  metadata {
    name = "beacon"
  }
}

