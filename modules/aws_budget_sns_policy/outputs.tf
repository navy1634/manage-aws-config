output "sns_topic_arn" {
  description = "AWS Budgetsのpublish policyを設定したSNS topicのARN。"
  value       = aws_sns_topic_policy.budgets.arn
}
