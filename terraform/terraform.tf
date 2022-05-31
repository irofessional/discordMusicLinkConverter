terraform {
  backend "s3" {
    bucket = "irofessional-main-tfstate"
    key    = "mrmr-discordmusiclinkconverterbot/terraform.tfstate"
    region = "ap-northeast-1"
  }
  required_providers {
    github = {
      source  = "integrations/github"
      version = "4.23.0"
    }
  }
}

