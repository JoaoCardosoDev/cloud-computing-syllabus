terraform {
  required_providers {
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.4.4"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

provider "minikube" {
}

provider "kubernetes" {
  host = "https://192.168.49.2:8443"
  config_path = "~/.kube/config"
  insecure                 = true

}

