resource "kubernetes_role" "app_role" {
  metadata {
    name      = "app-role"
    namespace = var.k8s_namespace
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "services", "configmaps"]
    verbs      = ["get", "list", "watch", "create", "update", "delete"]
  }
}

resource "kubernetes_role_binding" "app_role_binding" {
  metadata {
    name      = "app-role-binding"
    namespace = var.k8s_namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.app_role.metadata[0].name
  }

  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = var.k8s_namespace
  }
}
