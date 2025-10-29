
# Apply the ingress-nginx manifest using kubectl
resource "null_resource" "apply_ingress_nginx" {
  provisioner "local-exec" {
    command = "kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.7.1/deploy/static/provider/cloud/deploy.yaml"
  }
}

# Wait for the service to be created
data "kubernetes_service" "ingress_nginx" {
  depends_on = [null_resource.apply_ingress_nginx]

  metadata {
    name      = "ingress-nginx-controller"
    namespace = "ingress-nginx"
  }
}

# # Output the external IP
# output "ingress_nginx_ip" {
#   value = data.kubernetes_service.ingress_nginx.status[0].load_balancer[0].ingress[0].ip
#   description = "External IP of the NGINX Ingress Controller"
# }
