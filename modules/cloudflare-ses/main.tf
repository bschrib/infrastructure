terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.26"
    }
  }
}

resource "cloudflare_record" "ses_verification" {
  zone_id = var.zone_id
  name    = "_amazonses"
  value   = var.value
  type    = "TXT"
  ttl     = var.ttl
}

resource "cloudflare_record" "dkim" {
  for_each = toset(var.token)
  
  zone_id = var.zone_id
  name    = "${each.value}._domainkey"
  type    = "CNAME"
  value   = "${each.value}.dkim.amazonses.com"
  ttl     = var.ttl
}
