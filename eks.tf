module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 18.0"

  cluster_name    = "eks-cluster-mundose"
  cluster_version = "1.32"

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    mundose-node-group = {
      instance_types = ["t3.medium"]
      min_size       = 1
      max_size       = 2
      desired_size   = 1

      tags = {
        Environment = "Dev"
        Project     = "PINFINAL"
      }
    }
  }

  tags = {
    Environment = "Dev"
    Project     = "PINFINAL"
  }
}
