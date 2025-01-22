namespaces = [ "dev", "qa", "prod" ]

app = {
  name = "nginx"
  containerName = "nginx"
  replicas = {
    dev = 1
    qa = 2
    prod = 3
  }
  image = "nginx:alpine"
  port = 80
}

cluster = {
  name = "ex-cluster"
  nodes = 2
}