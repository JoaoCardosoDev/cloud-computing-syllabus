variable "client" {
  description = "Client name: Netflix, Meta, etc"
  type        = string
}

variable "env" {
  description = "Environments: dev, qa, prod, etc"
  type        = string
}

variable "domain" {
  description = "Domain Name (ex: www.example.com)"
  type        = string
}

variable "replicas" {
  description = "Replicas(number) for Odoo"
  type        = number
  default     = 1
}

variable "db_name" {
  description = "DB name"
  type        = string
  default     = "odoo"
}

variable "db_user" {
  description = "DB user"
  type        = string
  default     = "odoo"
}

variable "db_password" {
  description = "DB password"
  type        = string
  default     = "odoo"
}
