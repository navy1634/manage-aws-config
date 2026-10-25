locals {
  env            = "dev"
  aws_profile    = "sandbox-dev"
  region         = "ap-northeast-1"
  billing_region = "us-east-1"
  project        = "common-settings"
}

module "github_actions_oidc" {
  source = "../../../modules/github_actions_oidc"

  env = local.env
}
