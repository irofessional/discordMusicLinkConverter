resource "aws_ssm_parameter" "discord_bot_token" {
  name  = "discordMusicLinkConverter-Bot-Token"
  type  = "SecureString"
  value = var.discord_bot_token
}

resource "aws_ssm_parameter" "discord_category_id" {
  name  = "discordMusicLinkConverter-Bot-category"
  type  = "SecureString"
  value = var.discord_bot_category
}
