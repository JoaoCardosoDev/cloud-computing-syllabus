resource "kubernetes_ingress_v1" "app_ingress" {
  metadata {
    name      = "app-ingress"
    namespace = var.k8s_namespace
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
      "cert-manager.io/cluster-issuer"          = var.cert_issuer
    }
  }

  spec {
    rule {
      host = var.app_domain
      http {
        path {
          path = "/"
          backend {
            service {
              name = "app-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }

    tls {
      hosts       = [var.app_domain]
      secret_name = "app-tls-secret"
    }
  }
}
