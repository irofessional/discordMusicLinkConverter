variable "discord_bot_token" {
  type      = string
  sensitive = true
}

variable "discord_bot_category" {
  type = string
}

variable "ecr_uri" {
  type = string
}

variable "ecs_cluster" {
  type = string
}

variable "image_tag" {
  type = string
}