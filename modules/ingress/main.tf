resource "helm_release" "nginx_ingress" {
  name       = ""
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  namespace  = "ingress-nginx"
  version    = "4.6.1" # Use a stable, recent version
  create_namespace = true


  values = [
    file("${path.module}/values.yaml")
  ]
}

data "kubernetes_service" "nginx_ingress" {
  metadata {
    name      = "nginx-ingress-ingress-nginx-controller"
    namespace = "ingress-nginx"
  }

  depends_on = [helm_release.nginx_ingress]
}