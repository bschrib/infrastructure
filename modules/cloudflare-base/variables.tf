variable "account_id" {
  description = "The account ID of the Cloudflare account"
  type        = string

  nullable    = false
}

variable "zone" {
  description = "The name of the zone"
  type        = string

  nullable    = false
}