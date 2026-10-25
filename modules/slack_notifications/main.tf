resource "aws_chatbot_slack_channel_configuration" "this" {
  configuration_name    = "${var.name}-${var.env}"
  iam_role_arn          = aws_iam_role.chatbot.arn
  slack_channel_id      = var.slack_channel_id
  slack_team_id         = var.slack_team_id
  sns_topic_arns        = [aws_sns_topic.notifications.arn]
  guardrail_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"]
  logging_level         = "ERROR"
  tags = {
    Name = "${var.project}-${var.name}-${var.env}"
  }
}
