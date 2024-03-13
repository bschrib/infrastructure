variable "zone_id" {
  description = "The ID of the Cloudflare zone"
  type        = string
}

variable "value" {
  description = "The value of the DNS record"
  type        = string
}

variable "ttl" {
  description = "The TTL of the DNS record"
  type        = number
}

variable "token" {
  description = "The SES verification token"
  type        = list(string)
}
