output "odoo_url" {
  description = "URL for Odoo App"
  value       = "http://${kubernetes_service.odoo.metadata[0].name}.${var.k8s_namespace}.svc.cluster.local:8069"
}
