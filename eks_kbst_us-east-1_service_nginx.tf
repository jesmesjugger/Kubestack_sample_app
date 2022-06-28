module "eks_kbst_us-east-1_service_nginx" {
  providers = {
    kustomization = kustomization.eks_kbst_us-east-1
  }

  source  = "kbst.xyz/catalog/nginx/kustomization"
  version = "1.2.1-kbst.0"

  configuration = {
    apps = {}
    ops = {}
  }
}
