output "cluster_name" {
  value = module.eks.cluster_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "nginx_service_endpoint" {
  value = kubernetes_service.nginx_logs_service.status.0.load_balancer.0.ingress.0.hostname
}
