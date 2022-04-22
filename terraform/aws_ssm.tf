resource "aws_ssm_parameter" "discord_bot_token" {
  name  = "discordMusicLinkConverter-Bot-Token"
  type  = "SecureString"
  value = var.discord_bot_token
}
