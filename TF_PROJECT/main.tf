provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "client_namespace" {
  metadata {
    name = "${var.client}-${var.env}"
  }
}

data "http" "cert_manager" {
  url = "https://github.com/cert-manager/cert-manager/releases/download/v1.13.1/cert-manager.yaml"
}

resource "local_file" "cert_manager_yaml" {
  filename = "${path.module}/cert-manager.yaml"
  content  = data.http.cert_manager.response_body
}

resource "kubernetes_manifest" "cluster_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "letsencrypt-prod"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = "fake@example.com"
        privateKeySecretRef = {
          name = "letsencrypt-prod"
        }
        solvers = [
          {
            http01 = {
              ingress = {
                class = "nginx"
              }
            }
          }
        ]
      }
    }
  }
}

module "kubernetes_cluster" {
  source        = "./modules/cluster"
  k8s_namespace = kubernetes_namespace.client_namespace.metadata[0].name
}

module "postgresql" {
  source      = "./modules/database"
  k8s_namespace   = kubernetes_namespace.client_namespace.metadata[0].name
  db_name     = var.db_name
  db_user     = var.db_user
  db_password = var.db_password
}

module "odoo_deployment" {
  source        = "./modules/odoo"
  k8s_namespace     = kubernetes_namespace.client_namespace.metadata[0].name
  odoo_replicas = var.replicas
  db_host       = module.postgresql.db_host
  db_user       = module.postgresql.db_user
  db_password   = module.postgresql.db_password
  db_name       = module.postgresql.db_name
}

module "ingress" {
  source              = "./modules/ingress"
  app_domain         = var.domain
  k8s_namespace           = kubernetes_namespace.client_namespace.metadata[0].name
  cert_issuer = kubernetes_manifest.cluster_issuer.manifest.metadata.name
}
