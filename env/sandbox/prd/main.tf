locals {
  env            = "prod"
  aws_profile    = "sandbox-prod"
  region         = "ap-southeast-2"
  billing_region = "us-east-1"
  project        = "common-settings"
}

module "github_actions_oidc" {
  source = "../../../modules/github_actions_oidc"

  env = local.env
}
