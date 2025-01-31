output "db_host" {
  description = "PostgreSQL DB host(IP)"
  value       = kubernetes_service.postgres.spec[0].cluster_ip
}

output "db_user" {
  description = "PostgreSQL DB user"
  value       = var.db_user
}

output "db_password" {
  description = "PostgreSQL DB password"
  value       = var.db_password
}

output "db_name" {
  description = "PostgreSQL DB name"
  value       = var.db_name
}
