resource "helm_release" "prometheus" {
  name       = "prometheus-release"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"
  create_namespace = true
  timeout = 600

  set {
    name  = "server.persistentVolume.enabled"
    value = "false"
  }

  set {
    name = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name = "server.resources.limits.cpu"
    name = "500m"
  }

  set {
    name = "server.resources.limits.memory"
    value = "512Mi"
}

resource "helm_release" "grafana" {
  name       = "grafana-release"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"
  create_namespace = true
  timeout = 600

  set {
    name  = "persistence.enabled"
    value = "false"
  }
  
  set {
    name = "server.service.type"
    value = "LoadBalancer"

  set {
    name  = "adminPassword"
    value = "admin"
  }
   
  set {
    name  = "resources.limits.cpu"
    value = "500m"
  }

  set {
    name  = "resources.limits.memory"
    value = "512Mi"
  }
}

resource "kubernetes_service" "nginx_logs_service" {
  metadata {
    name      = "nginx-logs-service"
    namespace = "default"
  }

  spec {
    selector = {
      app = "nginx"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}
