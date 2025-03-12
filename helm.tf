resource "helm_release" "prometheus" {
  name       = "prometheus-release"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  namespace  = "monitoring"
  create_namespace = true
  timeout    = 1200  

  set {
    name  = "server.persistentVolume.enabled"
    value = "false"
  }

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "server.resources.limits.cpu"
    value = "1000m"  
  }

  set {
    name  = "server.resources.limits.memory"
    value = "1Gi"  
  }

  set {
    name  = "alertmanager.enabled"
    value = "false"  
  }
}

resource "helm_release" "grafana" {
  name       = "grafana-release"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  namespace  = "monitoring"
  create_namespace = true
  timeout    = 1200 

  set {
    name  = "persistence.enabled"
    value = "false"
  }

  set {
    name  = "service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "adminPassword"
    value = "admin"
  }

  set {
    name  = "resources.limits.cpu"
    value = "300m"
  }

  set {
    name  = "resources.limits.memory"
    value = "256Mi" 
  }

  set {
    name  = "tolerations[0].key"
    value = "node.kubernetes.io/not-ready"
  }
  set {
    name  = "tolerations[0].operator"
    value = "Exists"
  }
  set {
    name  = "tolerations[0].effect"
    value = "NoExecute"
  }
}


resource "kubernetes_deployment" "nginx_logs_deployment" {
  metadata {
    name      = "nginx-logs-deployment"
    namespace = "default"
    labels = {
      app = "nginx"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "256Mi"
            }
          }
        }
      }
    }
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
