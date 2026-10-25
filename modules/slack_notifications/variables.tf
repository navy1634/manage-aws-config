variable "env" {
  description = "resource名に付ける環境の短縮名"
  type        = string
}

variable "project" {
  description = "AWS Name tagに付けるproject名"
  type        = string
}

variable "name" {
  description = "Slack通知用resource name"
  type        = string
}

variable "slack_channel_id" {
  description = "通知先Slack channelのID"
  type        = string

  validation {
    condition     = length(trimspace(var.slack_channel_id)) > 0
    error_message = "Slack channel IDは空にできません"
  }
}

variable "slack_team_id" {
  description = "AWSと連携するSlack workspaceのID"
  type        = string

  validation {
    condition     = length(trimspace(var.slack_team_id)) > 0
    error_message = "Slack workspace IDは空にできません"
  }
}
