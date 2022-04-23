terraform {
  backend "s3" {
    bucket = "terraform-state-cafecat"
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

