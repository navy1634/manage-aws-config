data "aws_ssm_parameter" "slack_team_id" {
  name = "/manage-aws-config/slack-team-id-${local.env}"
}

data "aws_ssm_parameter" "slack_channel_id" {
  name = "/manage-aws-config/slack-channel-id-${local.env}"
}

module "slack_notifications" {
  source = "../../../modules/slack_notifications"

  env              = local.env
  project          = local.project
  name             = "alrt_sandbox"
  slack_channel_id = data.aws_ssm_parameter.slack_channel_id.value
  slack_team_id    = data.aws_ssm_parameter.slack_team_id.value
}
