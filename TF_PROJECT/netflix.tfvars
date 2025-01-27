environment = [ "dev", "prod" ]

deploy = {
  name = "netflix-deploy"
  containerName = "netflix"
  replicas = 3
  image = "odoo:latest"
  port = 8069
}

clusters = {
  name = "netflix-cluster"
  nodes = 3
}

POSTGRES_DB_SECRETS = {
    POSTGRES_PASSWORD = "odoo"
    POSTGRES_USER = "odoo"
    POSTGRES_DB = "postgres"
  }
