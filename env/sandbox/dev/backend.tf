terraform {
  backend "s3" {
    bucket       = "terraform-sandbox-dev.tfstate"
    profile      = "sandbox-dev"
    key          = "manage-aws-config/terraform.tfstate"
    region       = "ap-northeast-1"
    encrypt      = true
    use_lockfile = true
  }
}
