terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  backend "s3" {
    bucket  = "p6-tf-state"
    key     = "terraform.tfstate"
    encrypt = true
  }
}

provider "aws" {
  region = "ap-northeast-1"
  default_tags {
    tags = {
      Project = "puppy-pepper"
    }
  }
}
