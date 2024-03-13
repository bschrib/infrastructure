output "cloudflare_zone_id" {
  value = cloudflare_zone.root_domain.id
  description = "The ID of the cloudflare zone root domain"
}