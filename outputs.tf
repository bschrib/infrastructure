# will need to add new outputs here for each domain since there's not a good way to loop through at the moment via outputs.tf
output "smtp_credentials_brandon_schreiber_com" {
  value = module.aws_ses["brandon-schreiber.com"].smtp_credentials
  description = "SMTP credentials for brandon-schreiber.com"
  sensitive = true
}
