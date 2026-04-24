module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.15.1"

  name               = "myapp-eks-cluster"
  kubernetes_version = "1.30"

  # VPC Configuration
  vpc_id     = module.myapp-vpc.vpc_id
  subnet_ids = module.myapp-vpc.public_subnets

  # Enable public access to cluster endpoint
  endpoint_public_access = true

  # EKS Managed Node Group
  eks_managed_node_groups = {
    dev = {
      name = "dev"

      min_size     = 1
      max_size     = 1
      desired_size = 1

      instance_types = ["t3.small"]  # IMPORTANT: use small, not micro

      capacity_type = "ON_DEMAND"

      # Ensure nodes can join cluster properly
      ami_type = "AL2_x86_64"

      # Optional but helps stability
      create_launch_template = true
    }
  }

  # Tags
  tags = {
    Environment = "dev"
    Application = "myapp"
  }
}