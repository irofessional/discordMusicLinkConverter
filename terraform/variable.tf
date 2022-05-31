variable "discord_bot_token" {
  type      = string
  sensitive = true
}

variable "discord_bot_category" {
  type = string
}

variable "ecr_url" {
  type = string
}