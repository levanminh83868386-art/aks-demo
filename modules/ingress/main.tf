resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  create_namespace = true

  values = [
    file("${path.module}/values.yaml")
  ]
}


# resource "null_resource" "wait_for_ingress_ip" {
#   provisioner "local-exec" {
#     command = <<EOT
#     for i in {1..30}; do
#       IP=$(kubectl get svc -n ingress-nginx ingress-nginx-controller -o jsonpath='{.status.loadBalancer.ingress[0].ip}')
#       if [ ! -z "$IP" ]; then
#         echo "Ingress Controller IP: $IP"
#         echo $IP > ingress_ip.txt
#         exit 0
#       fi
#       echo "Waiting for Ingress IP..."
#       sleep 10
#     done
#     echo "Failed to get Ingress IP after waiting."
#     exit 1
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   depends_on = [helm_release.nginx_ingress]
# }


# data "kubernetes_service" "nginx_ingress" {
#   metadata {
#     name      = "ingress-nginx-controller"
#     namespace = "ingress-nginx"
#   }

#   depends_on = [helm_release.nginx_ingress]
# }