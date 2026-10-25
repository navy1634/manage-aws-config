data "aws_iam_policy_document" "chatbot_assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["chatbot.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "chatbot" {
  name               = "${var.name}-${var.env}"
  assume_role_policy = data.aws_iam_policy_document.chatbot_assume_role.json

  tags = {
    Name = "${var.project}-${var.name}-${var.env}"
  }
}

resource "aws_iam_role_policy_attachment" "cloudwatch_read_only" {
  role       = aws_iam_role.chatbot.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchReadOnlyAccess"
}
