variable "env" {
  description = "Name tagに付ける環境の短縮名。"
  type        = string

  validation {
    condition     = length(trimspace(var.env)) > 0
    error_message = "Name tagの環境名は空にできません。"
  }
}

variable "budget_name" {
  description = "作成するcost budgetの名前。"
  type        = string

  validation {
    condition     = length(trimspace(var.budget_name)) > 0
    error_message = "cost budgetの名前は空にできません。"
  }
}

variable "project" {
  description = "Name tagに付けるproject名。"
  type        = string

  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "Name tagのproject名は空にできません。"
  }
}

variable "limit_amount" {
  description = "cost budgetの上限額。"
  type        = number

  validation {
    condition     = var.limit_amount > 0
    error_message = "cost budgetの上限額は0より大きい値にしてください。"
  }
}

variable "notification_threshold" {
  description = "通知を送る予算使用率。"
  type        = number

  validation {
    condition     = var.notification_threshold > 0 && var.notification_threshold <= 100
    error_message = "通知しきい値は0より大きく100以下にしてください。"
  }
}

variable "limit_unit" {
  description = "cost budgetの上限額に使う通貨単位。"
  type        = string

  validation {
    condition     = length(trimspace(var.limit_unit)) > 0
    error_message = "cost budgetの通貨単位は空にできません。"
  }
}

variable "notification_type" {
  description = "実績額または予測額のどちらを通知対象にするか。"
  type        = string
  default     = "ACTUAL"

  validation {
    condition     = contains(["ACTUAL", "FORECASTED"], var.notification_type)
    error_message = "通知種別はACTUALまたはFORECASTEDで指定してください。"
  }
}

variable "sns_topic_arn" {
  description = "budget通知を受け取り、budgetと同じaccountにあるSNS topicのARN。"
  type        = string
}

variable "time_unit" {
  description = "cost budgetの集計期間。"
  type        = string

  validation {
    condition     = contains(["DAILY", "MONTHLY"], var.time_unit)
    error_message = "集計期間はDAILYまたはMONTHLYで指定してください。"
  }
}
