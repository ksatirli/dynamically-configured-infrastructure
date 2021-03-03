# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace
resource "kubernetes_namespace" "beacon" {
  metadata {
    name = var.app_name
  }
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment
resource "kubernetes_deployment" "beacon" {
  metadata {
    name      = var.app_name
    namespace = kubernetes_namespace.beacon.id
    labels = {
      app = var.app_name
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.app_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app_name
        }
      }

      spec {
        container {
          image = var.app_image
          name  = var.app_name
        }
      }
    }
  }
}

# see https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service
resource "kubernetes_service" "beacon" {
  metadata {
    name      = kubernetes_deployment.beacon.metadata.0.name
    namespace = kubernetes_namespace.beacon.id
  }

  spec {
    selector = {
      app = kubernetes_deployment.beacon.metadata.0.labels.app
    }

    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
