terraform {
  backend "s3" {
    bucket = "schreiber-terraform-backend-lowers"
    key    = "cloudflare.tfstate"
    region = "us-east-2"
    encrypt = true
  }
}

resource "cloudflare_zone" "root_domain" {
  for_each = toset(var.root_domains)
  
  account_id = var.account_id
  paused   = false
  plan     = "free"
  type     = "full"
  zone     = each.key
}

resource "cloudflare_record" "domain_records" {
  for_each = var.dns_records

  zone_id = cloudflare_zone.root_domain[each.value.zone].id
  name    = each.value.name
  type    = each.value.type
  ttl     = lookup(each.value, "ttl", 3600)
  proxied = lookup(each.value, "proxied", false)

  dynamic "data" {
    for_each = each.value.type == "SRV" ? [each.value.data] : []
    content {
      service  = data.value.service
      proto    = data.value.proto
      name     = data.value.name
      priority = data.value.priority
      weight   = data.value.weight
      port     = data.value.port
      target   = data.value.target
    }
  }

  value = each.value.type != "SRV" ? each.value.value : null
}
