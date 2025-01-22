resource "minikube_cluster" "my-cluster" {
  cluster_name = "ex2"
  nodes = 1
}

resource "kubernetes_namespace" "namespace" {
    for_each = toset(var.namespaces)
  metadata {
    name = each.key
  }
}
