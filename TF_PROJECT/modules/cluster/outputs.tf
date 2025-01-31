output "app_role_name" {
  description = "The name of the created role for the application"
  value       = kubernetes_role.app_role.metadata[0].name
}

output "app_role_binding_name" {
  description = "The name of the created role binding for the application"
  value       = kubernetes_role_binding.app_role_binding.metadata[0].name
}
