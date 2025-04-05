module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name   = "xpto-vpc"
  cidr   = "10.0.0.0/16"
  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
  enable_nat_gateway = true
  enable_vpn_gateway = true
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "xpto-cluster"
  cluster_version = "1.29"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  node_groups = {
    xpto_nodes = {
      desired_capacity = var.eks_desired_capacity
      max_capacity     = var.eks_max_size
      instance_type    = var.eks_instance_type
    }
  }
}