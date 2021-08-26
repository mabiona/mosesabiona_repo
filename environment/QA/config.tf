terraform {
  backend "s3" {
    bucket         = "backenddnb"
    key            = "qa/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

