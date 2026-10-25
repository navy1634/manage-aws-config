resource "aws_budgets_budget" "this" {
  name         = "${var.budget_name}-${var.env}"
  budget_type  = "COST"
  time_unit    = var.time_unit
  limit_amount = tostring(var.limit_amount)
  limit_unit   = var.limit_unit

  notification {
    comparison_operator       = "GREATER_THAN"
    notification_type         = var.notification_type
    subscriber_sns_topic_arns = [var.sns_topic_arn]
    threshold                 = var.notification_threshold
    threshold_type            = "PERCENTAGE"
  }

  tags = {
    Name = "${var.project}-${var.budget_name}-${var.env}"
  }
}
