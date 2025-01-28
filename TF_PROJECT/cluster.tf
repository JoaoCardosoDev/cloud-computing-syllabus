resource "minikube_cluster" "my-cluster" {
  cluster_name = var.cluster
  nodes = var.nodes
}

resource "kubernetes_config_map" "odoo_config" {

  metadata {
    name      = "odoo-config"
    namespace = var.environment
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