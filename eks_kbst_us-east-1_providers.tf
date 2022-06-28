provider "aws" {
  alias = "eks_kbst_us-east-1"

  region = "us-east-1"
}

provider "kustomization" {
  alias = "eks_kbst_us-east-1"

  kubeconfig_raw = module.eks_kbst_us-east-1.kubeconfig
}

locals {
  eks_kbst_us-east-1_kubeconfig = yamldecode(module.eks_kbst_us-east-1.kubeconfig)
}

provider "kubernetes" {
  alias = "eks_kbst_us-east-1"

  host                   = local.eks_kbst_us-east-1_kubeconfig["clusters"][0]["cluster"]["server"]
  cluster_ca_certificate = base64decode(local.eks_kbst_us-east-1_kubeconfig["clusters"][0]["cluster"]["certificate-authority-data"])
  token                  = local.eks_kbst_us-east-1_kubeconfig["users"][0]["user"]["token"]
}
