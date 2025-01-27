resource "minikube_cluster" "my-cluster" {
  cluster_name = var.clusters.name
  nodes = var.clusters.nodes
}

resource "kubernetes_namespace" "namespace" {
    for_each = toset(var.environment)
  metadata {
    name = each.key
  }
}

resource "kubernetes_config_map" "odoo_config" {
  for_each = toset(var.environment)

  metadata {
    name      = "odoo-config"
    namespace = each.key
  }

  data = {
    "odoo.conf" = <<EOF
        [options]
        addons_path = /mnt/extra-addons
        admin_passwd = admin
        data_dir = /var/lib/odoo

        #proxy_mode = True
        #workers = 1
        #limit_request = 2000
        #max_cron_threads = 1

        #gevent_port=8072

        #list_db = True
        EOF
  }
}