terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.26"
    }
  }
}

resource "cloudflare_zone" "root_domain" {
  account_id = var.account_id
  paused     = false
  plan       = "free"
  type       = "full"
  zone       = var.zone
}
