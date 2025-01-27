resource "kubernetes_ingress" "ingress" {
  metadata {
    name = "${var.deploy.name}-ingress"
  }

  spec {
    backend {
      service_name = "${var.deploy.name}-service"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "${var.deploy.name}-service1"
            service_port = 8080
          }

          path = "/app1/*"
        }

        path {
          backend {
            service_name = "${var.deploy.name}-service2"
            service_port = 8080
          }

          path = "/app2/*"
        }
      }
    }

    tls {
      secret_name = "tls-secret"
    }
  }
}

resource "kubernetes_service" "postgres" {
    for_each = toset(var.environment)
  metadata {
    name      = "${each.key}-postgres-service"
    namespace = each.key
  }

  spec {
    selector = {
      app = "database"
    }
    port {
      port        = 5432
      target_port = 5432
    }
    type = "ClusterIP"
  }
}