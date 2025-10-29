# monitoring.tf - Deploy the Helm chart
resource "helm_release" "kube_prometheus_stack" {
  # Helm repository details
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "59.0.0" # Use a stable, recent version
  namespace  = "monitoring"
  create_namespace = true
  
  values = [
    templatefile("${path.module}/values.yaml", {
      ip = "123.123.123.123"
    })
  ]

  # Optional: Wait for all resources to be ready (can take a few minutes)
  timeout = 600
  wait    = true
}