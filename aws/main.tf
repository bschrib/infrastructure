terraform {
  backend "s3" {
    bucket = "schreiber-terraform-backend-lowers"
    key    = "terraform.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}

resource "aws_ses_domain_identity" "brandon__schreiber_com" {
  domain = "brandon-schreiber.com"
}

resource "aws_ses_domain_dkim" "brandon__schreiber_com_dkim" {
  domain = aws_ses_domain_identity.brandon__schreiber_com.domain
}