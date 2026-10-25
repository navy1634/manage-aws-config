variable "env" {
  description = "Name tagに付ける環境の短縮名"
  type        = string
  nullable    = false

  validation {
    condition     = length(trimspace(var.env)) > 0
    error_message = "Name tagの環境名は空にできません。"
  }
}
