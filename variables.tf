variable "domains" {
  type        = list(string)
  description = "List of domains to configure SES/DKIM for"
  default     = []
}

variable "account_id" {
  type     = string
  nullable = false
}

variable "cloudflare_root_zones" {
  description = "The root zones to create/manage in Cloudflare"
  type        = list(string)
  default     = []
}

variable "worker_redirects" {
  description = "Configuration for Cloudflare worker routes"
  type = map(object({
    name        = string
    filename    = string

    zone_name   = string
    pattern     = string
    script_name = string
  }))
}
