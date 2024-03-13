terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.26"
    }
  }
}

resource "cloudflare_worker_script" "redirect_script" {
  account_id = var.account_id
  name       = var.name
  content    = file("${path.module}/scripts/${var.filename}")
}

resource "cloudflare_worker_route" "worker_routes" {
  zone_id     = var.zone_id
  pattern     = var.pattern
  script_name = var.script_name
}