module "eks_kbst_us-east-1" {
  providers = {
    aws        = aws.eks_kbst_us-east-1
    kubernetes = kubernetes.eks_kbst_us-east-1
  }

  source = "github.com/kbst/terraform-kubestack//aws/cluster?ref=v0.17.0-beta.0"

  configuration = {
    apps = {
      base_domain = var.base_domain
      cluster_availability_zones = "us-east-1a,us-east-1b,us-east-1c,us-east-1d,us-east-1f"
      cluster_desired_capacity = 3
      cluster_instance_type = "t3.medium"
      cluster_max_size = 6
      cluster_min_size = 3
      name_prefix = "kbst"
    }
    ops = {}
  }
}
