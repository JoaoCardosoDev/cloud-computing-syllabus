resource "kubernetes_deployment" "app" {
    for_each = toset(var.namespaces)
  metadata {
    name      = "${var.app.name}-${each.key}"
    namespace = each.key
    labels = {
      app = var.app.name
    }
  }

  spec {
    replicas = var.app.replicas[each.key]

    selector {
      match_labels = {
        app = var.app.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app.name
        }
      }

      spec {
        container {
          name  = var.app.containerName
          image = var.app.image
          port {
            container_port = var.app.port
          }
        }
      }
    }
  }
}