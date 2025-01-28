resource "kubernetes_service" "postgres" {
  metadata {
    name      = "postgres-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "postgres"
    }

    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_service" "odoo" {
  metadata {
    name      = "odoo-service"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = "odoo"
    }

    port {
      port        = 80
      target_port = 8069
    }

    type = "ClusterIP"
  }
}

output "odoo_url" {
  description = "odoo app url"
  value       = "http://${kubernetes_service.odoo.metadata[0].name}.${var.namespace}.svc.cluster.local:8069"
}

output "postgres_service_name" {
  description = "name of postgres service"
  value       = kubernetes_service.postgres.metadata[0].name
}

output "ingress_url" {
  description = "app url"
  value       = module.ingress.ingress_url
}

output "namespace" {
  description = "app namespace"
  value       = kubernetes_namespace.client_namespace.metadata[0].name
}
