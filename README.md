# Terraform EKS Cluster Deployment

This project deploys an EKS cluster named `eks-cluster-mundose` in the `us-east-1` region. The cluster includes:
- A node group (`mundose-node-group`) with `t2.micro` instances.
- Prometheus and Grafana deployed using Helm.
- An NGINX service (`nginx-logs-service`) for log checking.

## Prerequisites
1. AWS CLI configured with valid credentials.
2. Terraform installed.
3. kubectl and helm installed (for managing the cluster after deployment).

## Usage

1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/terraform-eks-mundose.git
   cd terraform-eks-mundose
