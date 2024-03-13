variable "account_id" {
  description = "Cloudflare account ID"
  type        = string
}

variable "name" {
  description = "The name of the cloudflare worker script"
  type        = string
}

variable "filename" {
  description = "The name to the file which contains the script for the worker script"
  type        = string
}

variable "zone_id" {
  description = "The cloudflare zone ID"
  type        = string
}

variable "pattern" {
  description = "The URL pattern to route traffic to the cloudflare worker script"
  type        = string
}

variable "script_name" {
  description = "The name of the script for the cloudflare worker route"
  type        = string
}
