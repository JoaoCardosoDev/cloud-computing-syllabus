environment = [ "dev", "prod", "staging" ]

deploy = {
  name = "rockstar-deploy"
  containerName = "rockstar"
  replicas = 3
  image = "nginx:alpine"
  port = 80
}

clusters = {
  name = "rockstar-cluster"
  nodes = 1
}