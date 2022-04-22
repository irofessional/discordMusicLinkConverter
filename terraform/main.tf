terraform {
  backend "s3" {
    bucket = "terraform-state-cafecat"
    key    = "mrmr-discordmusiclinkconverterbot/terraform.tfstate"
    region = "ap-northeast-1"
  }
}
