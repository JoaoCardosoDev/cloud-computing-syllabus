variable "environment" {
  type = list(string)
  default = [ "dev", "beta", "prod" ]
  description = "Environment (aka k8s namespace)"
#   validation {
#     condition = contains(["dev", "beta", "prod"], var.environment)
#     error_message = "Environment should be one of [dev, beta, prod]"
#   }
}

variable "cluster" {
    type = object({
      name = string
      nodes = number
    })
    nullable = false
    description = "Cluster definition"
  
}

variable "namespaces" {
  type = list(string)
  description = "K8s Ns"
  nullable = false
}

variable "app" {
  type = object({
    name = string
    replicas = map(number)
    image = string
    containerName = string
    port = number
  })
  nullable = false
}