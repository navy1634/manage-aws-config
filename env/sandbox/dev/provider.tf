terraform {
  required_version = ">=1.15.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.50"
    }
  }
}

# Provider
provider "aws" {
  profile = local.aws_profile
  region  = local.region

  default_tags {
    tags = {
      env     = local.env
      project = local.project
    }
  }
}

# AWS Budgets APIはus-east-1を使い、Slack通知topicは通常のAWS regionに置きます。
provider "aws" {
  alias   = "billing"
  profile = local.aws_profile
  region  = local.billing_region

  default_tags {
    tags = {
      env     = local.env
      project = local.project
    }
  }
}
