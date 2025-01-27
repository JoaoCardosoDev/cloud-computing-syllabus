environment = [ "dev", "prod", "staging", "qa" ]

deploy = {
  name = "meta-deploy"
  containerName = "meta"
  replicas = 3
  image = "nginx:alpine"
  port = 80
}

clusters = {
  name = "meta-cluster"
  nodes = 2
}