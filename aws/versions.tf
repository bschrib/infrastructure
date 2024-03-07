terraform {
  required_version = ">= 1.7.4"

  required_providers {
    aws = {
      source   = "hashicorp/aws"
      version  = "~> 5.39"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
