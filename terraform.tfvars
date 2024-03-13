domains = [
  "brandon-schreiber.com"
]

cloudflare_root_zones = [
  "brandon-schreiber.com",
  "schreiber.link",
  "roguedeveloper.net"
]

worker_redirects = {
  "linkedin_redirect_route" = {
    name        = "linkedin-redirect"
    filename    = "redirect-worker.js"
    zone_name   = "brandon-schreiber.com"
    pattern     = "*brandon-schreiber.com/*"
    script_name = "linkedin-redirect"
  }
}
