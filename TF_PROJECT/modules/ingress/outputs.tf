output "ingress_url" {
  description = "The URL for accessing the application"
  value       = "https://${var.app_domain}"
}
