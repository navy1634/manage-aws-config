module "aws_budget_daily_80" {
  source = "../../../modules/aws_budgets"

  providers = {
    aws = aws.billing
  }

  env     = local.env
  project = local.project

  budget_name            = "account-daily-80"
  limit_amount           = 3
  limit_unit             = "USD"
  notification_threshold = 80
  sns_topic_arn          = module.aws_budget_sns_policy.sns_topic_arn
  time_unit              = "DAILY"
}

module "aws_budget_daily_100" {
  source = "../../../modules/aws_budgets"

  providers = {
    aws = aws.billing
  }

  env     = local.env
  project = local.project

  budget_name            = "account-daily-100"
  limit_amount           = 3
  limit_unit             = "USD"
  notification_threshold = 100
  sns_topic_arn          = module.aws_budget_sns_policy.sns_topic_arn
  time_unit              = "DAILY"
}

module "aws_budget_monthly_80" {
  source = "../../../modules/aws_budgets"

  providers = {
    aws = aws.billing
  }

  env     = local.env
  project = local.project

  budget_name            = "account-monthly-80"
  limit_amount           = 100
  limit_unit             = "USD"
  notification_threshold = 80
  sns_topic_arn          = module.aws_budget_sns_policy.sns_topic_arn
  time_unit              = "MONTHLY"
}

module "aws_budget_monthly_100" {
  source = "../../../modules/aws_budgets"

  providers = {
    aws = aws.billing
  }

  env     = local.env
  project = local.project

  budget_name            = "account-monthly-100"
  limit_amount           = 100
  limit_unit             = "USD"
  notification_threshold = 100
  sns_topic_arn          = module.aws_budget_sns_policy.sns_topic_arn
  time_unit              = "MONTHLY"
}

module "aws_budget_sns_policy" {
  source = "../../../modules/aws_budget_sns_policy"

  sns_topic_arn = module.slack_notifications.sns_topic_arn
}
