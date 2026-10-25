data "aws_ssm_parameter" "slack_team_id" {
  name = "/manage-aws-config/slack-team-id-prd"
}

data "aws_ssm_parameter" "slack_channel_id" {
  name = "/manage-aws-config/slack-channel-id-prd"
}

module "slack_notifications" {
  source = "../../../modules/slack_notifications"

  env              = local.env
  project          = local.project
  name             = "account-notifications"
  slack_channel_id = data.aws_ssm_parameter.slack_channel_id.value
  slack_team_id    = data.aws_ssm_parameter.slack_team_id.value
}
