variable "k8s_namespace" {
  description = "The namespace for the Odoo deployment"
  type        = string
}

variable "db_user" {
  description = "PostgreSQL DB user"
  type        = string
}

variable "db_password" {
  description = "PostgreSQL DB password"
  type        = string
}

variable "db_name" {
  description = "PostgreSQL DB name"
  type        = string
}
