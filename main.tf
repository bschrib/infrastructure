terraform {
  backend "s3" {
    bucket  = "schreiber-terraform-backend-lowers"
    key     = "infrastructure.tfstate"
    region  = "us-east-2"
  }
  required_version = ">= 1.7.4"

  required_providers {
    aws = {
      source   = "hashicorp/aws"
      version  = "~> 5.39"
    }
  }
}

locals {
  aws_region = "us-east-2"
}

provider "aws" {
  region = local.aws_region
}

module "aws_ses" {
  source     = "./modules/aws-ses"
  for_each   = toset(var.domains)

  domain     = each.value
  aws_region = local.aws_region
}

module "cloudflare_base" {
  source     = "./modules/cloudflare-base"
  for_each   = toset(var.cloudflare_root_zones)

  account_id = var.account_id
  zone       = each.value
}

module "cloudflare_worker_redirects" {
  source    = "./modules/cloudflare-worker-redirects"
  for_each  = var.worker_redirects

  account_id   = var.account_id
  name         = each.value.name
  filename     = each.value.filename

  zone_id      = module.cloudflare_base[each.value.zone_name].cloudflare_zone_id
  pattern      = each.value.pattern
  script_name  = each.value.script_name
}

module "cloudflare_ses" {
  source  = "./modules/cloudflare-ses"
  for_each = toset(var.domains)

  zone_id = module.cloudflare_base[var.cloudflare_root_zones[0]].cloudflare_zone_id
  value   = module.aws_ses[each.value].ses_domain_identity_verification_token
  ttl     = 1
  token   = module.aws_ses[each.value].ses_domain_dkim_tokens
}


// todo;
// either add a python script to convert the smtp secret to a password and call on it via a null call in terraform?
// add script to facilitate requesting move out of sandbox?