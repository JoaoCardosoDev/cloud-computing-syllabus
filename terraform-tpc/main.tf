resource "kubernetes_namespace" "app_namespace" {
  for_each = toset(var.namespaces)

  metadata {
    name = each.key
  }
}



resource "minikube_cluster" "minikube" {
  cluster_name = "tpc-cluster"
  nodes        = 1
}


resource "kubernetes_deployment" "app" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "${var.app.name}-${each.key}"
    namespace = each.key
    labels = {
      app = var.app.name
    }
  }

  spec {
    replicas = var.app.replicas[each.key]

    selector {
      match_labels = {
        app = var.app.name
      }
    }

    template {
      metadata {
        labels = {
          app = var.app.name
        }
      }

      spec {
        container {
          name  = var.app.containerName
          image = var.app.image

          port {
            container_port = var.app.port
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "app_service" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "${var.app.name}-service-${each.key}"
    namespace = each.key
  }

  spec {
    selector = {
      app = var.app.name
    }

    port {
      protocol    = "TCP"
      port        = 80
      target_port = var.app.port
    }

    type = "ClusterIP"
  }
}



resource "kubernetes_service" "wordpress_service" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "wordpress-service-${each.key}"
    namespace = kubernetes_namespace.app_namespace[each.key].metadata[0].name
  }

  spec {
    selector = {
      app = "wordpress"
    }
    port {
      port        = 80
      target_port = 80
    }
  }
}

resource "kubernetes_deployment" "mysql" {
  for_each = toset(var.namespaces)  # Use for_each to loop through namespaces

  metadata {
    name      = "mysql-deployment-${each.key}"
    namespace = kubernetes_namespace.app_namespace[each.key].metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:5.7"
          port {
            container_port = 3306
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "mysql_service" {
  for_each = toset(var.namespaces)

  metadata {
    name      = "mysql-service-${each.key}"
    namespace = kubernetes_namespace.app_namespace[each.key].metadata[0].name
  }

  spec {
    selector = {
      app = "mysql"
    }

    port {
      port        = 3306
      target_port = 3306
    }

    type = "ClusterIP"
  }
}



