terraform {
  backend "s3" {
    bucket = "irofessional-main-tfstate"
    key    = "mrmr-discordmusiclinkconverterbot/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

