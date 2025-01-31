variable "app_domain" {
  description = "Domain Name of the app"
  type        = string
}

variable "k8s_namespace" {
  description = "K8s namespace"
  type        = string
}

variable "cert_issuer" {
  description = "TLS cert Management"
  type        = string
}
