module "platform" {
  source = "../../modules/platform"

  environment = "perf"

  region = "us-east-2"

  cluster_version = "1.31"

  instance_type = "t3.large"
}
