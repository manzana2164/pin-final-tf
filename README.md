# Grupo 5 - PIN FINAL DevOps Mundose 2403
# Terraform EKS Cluster Deployment 

Este PIN FINAL presenta el deploy de un clúster `eks-cluster-mundose` en la region `us-east-1` de AWS. El Clúster incluye:
- Un Grupo de Nodo (`mundose-node-group`) con una isntancia `t3.medium`.
- Prometheus & Grafana se deployan usando Helm.
- Un servicio NGINX (`nginx-logs-service`) para controlar los logs.

## Prerrequisitos
1. AWS CLI configurados con las credenciales válidas de user IAM con policies configuradas para EC2 Full Access.
2. Terraform iinstalado.
3. kubectl y helm instalado para verificación de logs y depuración.

## Uso de este repositorio

1. Clonar este repo:
   ```bash
   git clone https://github.com/your-repo/terraform-eks-mundose.git
   cd terraform-eks-mundose
   
Seguir las instrucciones del PDF adjunto a la cursada.
