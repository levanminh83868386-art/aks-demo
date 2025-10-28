# monitoring.tf - Deploy the Helm chart
resource "helm_release" "kube_prometheus_stack" {
  # Helm repository details
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"
  version    = "59.0.0" # Use a stable, recent version
  namespace  = "monitoring"
  create_namespace = true
  
  set {
    name  = "grafana.enabled"
    value = "true"
  }

  set {
    name  = "grafana.adminPassword"
    value = "admin123"
  }

  set {
    name  = "prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues"
    value = "false"
  }
  # Optional: Wait for all resources to be ready (can take a few minutes)
  timeout = 600
  wait    = true
}