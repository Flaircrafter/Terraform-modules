terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }

  backend "s3" {
    bucket = "thepinkcarrot"
    key    = "xyz.terraform.tfstate"
    region = "eu-west-1"
    profile = "interview"
  }
}

provider "aws" {
  region = "eu-west-1" // Ireland as Default region
  shared_config_files      = ["/Users/knayyar/.aws/config"]
  shared_credentials_files = ["/Users/knayyar/.aws/credentials"]
  profile                  = "interview"
}

// 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 github access token

provider "aws" {
  alias = "amerikha"
  region = "us-east-1" // Ireland as Default region
  shared_config_files      = ["/Users/knayyar/.aws/config"]
  shared_credentials_files = ["/Users/knayyar/.aws/credentials"]
  profile                  = "interview"
}