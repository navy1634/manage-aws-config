terraform {
  backend "s3" {
    bucket       = "terraform-sandbox-prod.tfstate"
    profile      = "sandbox-prod"
    key          = "manage-aws-config/terraform.tfstate"
    region       = "ap-southeast-2"
    encrypt      = true
    use_lockfile = true
  }
}
