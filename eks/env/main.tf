module "platform" {
  source = "../modules/platform"
  environment     = var.environment
  region          = var.region
  cluster_version = var.cluster_version
  instance_type   = var.instance_type
}
