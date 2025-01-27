variable "namespaces" {
  description = "List of namespaces to create"
  type        = list(string)
  default     = ["dev", "staging", "prod"]
}

variable "app" {
  description = "Application configuration"
  type = object({
    name          = string
    containerName = string
    image         = string
    port          = number
    replicas      = map(number)
  })
  default = {
    name          = "my-app"
    containerName = "my-container"
    image         = "nginx:latest"
    port          = 80
    replicas = {
      dev     = 1
      staging = 2
      prod    = 3
    }
  }
}
