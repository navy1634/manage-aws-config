resource "aws_sns_topic" "notifications" {
  name = "${var.name}-${var.env}"

  tags = {
    Name = "${var.project}-${var.name}-${var.env}"
  }
}
