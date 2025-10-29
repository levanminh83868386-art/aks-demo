# output "ingress_controller_ip" {
#   value = try(
#     data.kubernetes_service.nginx_ingress.status[0].load_balancer[0].ingress[0].ip,
#     data.kubernetes_service.nginx_ingress.status[0].load_balancer[0].ingress[0].hostname
#   )
# }


output "ingress_controller_ip" {
  value = data.kubernetes_service.ingress_nginx.status[0].load_balancer[0].ingress[0].ip
  description = "Public IP of the NGINX Ingress Controller"
} 
