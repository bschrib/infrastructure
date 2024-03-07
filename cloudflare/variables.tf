variable "account_id" {
  type     = string
  nullable = false
}

variable "root_domains" {
  description = "The domain of the root URL (e.g. www.roguedeveloper.net)"
  type        = list(string)

  nullable    = false
}

variable "dns_records" {
  description = "DNS records for specific domains"
  type = map(object({
    zone     = string
    name     = string
    type     = string
    value    = optional(string)
    ttl      = optional(number)
    proxied  = optional(bool)
    data     = optional(map(any))
  }))
  default = {}
}
