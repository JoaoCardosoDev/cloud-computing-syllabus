resource "kubernetes_ingress" "prod_ingress" {
  for_each = toset([for ns in var.namespaces : ns if ns == "prod"])

  metadata {
    name      = "${var.app.name}-ingress"
    namespace = each.key
    annotations = {
      "kubernetes.io/ingress.class" : "nginx"
      "cert-manager.io/cluster-issuer" : "letsencrypt-prod"
    }
  }

  spec {
    tls {
      hosts      = ["your-domain.com"]
      secret_name = "tls-secret"
    }

    rule {
      host = "your-domain.com"

      http {
        path {
          path = "/"
          backend {
            service_name = kubernetes_service.app_service[each.key].metadata[0].name
            service_port = 80
          }
        }
      }
    }
  }
}
