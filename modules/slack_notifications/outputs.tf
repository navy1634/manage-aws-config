output "sns_topic_arn" {
  description = "共通通知用SNS topicのARN。"
  value       = aws_sns_topic.notifications.arn
}
