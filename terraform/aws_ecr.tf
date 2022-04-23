resource "aws_ecr_repository" "bot_image" {
  name                 = "discordmusiclinkconverter"
  image_tag_mutability = "IMMUTABLE"

}