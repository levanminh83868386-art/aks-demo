variable "host" {
  type        = string
  description = "aks cluster host"
}

variable "client_certificate" {
  type        = string
  description = "aks cluster client certificate"
}

variable "client_key" {
  type        = string
  description = "aks cluster client key"
}

variable "cluster_ca_certificate" {
  type        = string
  description = "aks cluster cluster ca certificate"
}

# variable "ingress_controller_ip" {
#   type        = string
#   description = "Public IP of the NGINX Ingress Controller"
# }