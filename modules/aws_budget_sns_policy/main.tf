data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "sns_topic" {
  statement {
    sid    = "AllowBudgetsToPublish"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["budgets.amazonaws.com"]
    }

    actions   = ["sns:Publish"]
    resources = [var.sns_topic_arn]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values   = [data.aws_caller_identity.current.account_id]
    }

    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values   = ["arn:aws:budgets::${data.aws_caller_identity.current.account_id}:budget/*"]
    }
  }
}

resource "aws_sns_topic_policy" "budgets" {
  arn    = var.sns_topic_arn
  policy = data.aws_iam_policy_document.sns_topic.json
}
