variable "environment" {
  type = list(string)
  default = [ "dev", "beta", "prod" ]
  description = "Environment (aka k8s namespace)"
}

variable "deploy" {
    type = object({
      name = string
      port = number
      image = string
      containerName = string
      replicas = number
    })
    nullable = false
    description = "Deployment definition"
}

variable "clusters" {
  type = object({
    name  = string
    nodes = number
  })
  nullable = false
  description = "List of clusters with their names and node counts"
}

variable "POSTGRES_DB_SECRETS" {
  type = object({
    POSTGRES_PASSWORD = string
    POSTGRES_USER = string
    POSTGRES_DB = string
  })
  sensitive = true  
}