namespaces = ["dev", "staging", "prod"]

app = {
  name          = "tpc-app"
  containerName = "tpc-container"
  image         = "nginx:1.21-alpine"
  port          = 8080
  replicas = {
    dev     = 1
    staging = 2
    prod    = 3
  }
}
