resource "kubernetes_deployment" "odoo" {
  for_each = toset(var.environment)

  metadata {
    name      = "${var.deploy.name}-${each.key}"
    namespace = each.key
    labels = {
      app = var.deploy.name
    }
  }

  spec {
    replicas = var.deploy.replicas
    selector {
      match_labels = {
        app = var.deploy.name
      }
    }
    template {
      metadata {
        labels = {
          app = var.deploy.name
        }
      }
      spec {
        container {
          name  = var.deploy.containerName
          image = var.deploy.image
          port {
            container_port = var.deploy.port
          }
          env {
            name  = "HOST"
            value = "${each.key}-postgres-service" 
          }
          env {
            name  = "PORT"
            value = "5432"
          }
          env {
            name  = "USER"
            value = var.POSTGRES_DB_SECRETS.POSTGRES_USER
          }
          env {
            name  = "PASSWORD"
            value = var.POSTGRES_DB_SECRETS.POSTGRES_PASSWORD
          }
          volume_mount {
            name      = "odoo-config"
            mount_path = "/path/to/config"
          }
        }
        volume {
          name = "odoo-config"
          config_map {
            name = "odoo-config" 
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "postgres" {
    for_each = toset(var.environment)

  metadata {
    name      = "${each.key}-postgres-deployment"
    namespace = each.key
    labels = {
      app = "database"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "database"
      }
    }
    template {
      metadata {
        labels = {
          app = "database"
        }
      }
      spec {
        container {
          name  = "postgres"
          image = "postgres:17"
          port {
            container_port = 5432
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = var.POSTGRES_DB_SECRETS.POSTGRES_PASSWORD
          }
          env {
            name  = "POSTGRES_USER"
            value = var.POSTGRES_DB_SECRETS.POSTGRES_USER
          }
          env {
            name  = "POSTGRES_DB"
            value = var.POSTGRES_DB_SECRETS.POSTGRES_DB
          }
          volume_mount {
            name      = "postgres-data"
            mount_path = "/var/lib/postgresql/data"
          }
        }
        volume {
          name = "postgres-data"
          persistent_volume_claim {
            claim_name = "postgres-pvc"
          }
        }
      }
    }
  }
}