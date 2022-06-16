resource "aws_ssm_parameter" "discord_token" {
  name  = "discordMusicLinkConverter-Bot-Token"
  type  = "SecureString"
  value = var.discord_token
}

resource "aws_ssm_parameter" "discord_id" {
  name  = "discordMusicLinkConverter-Bot-target-ID"
  type  = "String"
  value = var.discord_id
}
