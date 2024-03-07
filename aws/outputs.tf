output "aws_ses_domain_entity_arn" {
  value = aws_ses_domain_identity.brandon__schreiber_com.arn
  description = "The arn of the aws_ses_domain_identity"
}

output "aws_ses_domain_identity_verification_token" {
  value = aws_ses_domain_identity.brandon__schreiber_com.verification_token
  description = "The verification_token of the aws_ses_domain_identity"
}

output "aws_ses_domain_dkim_dkim_tokens" {
  value = aws_ses_domain_dkim.brandon__schreiber_com_dkim.dkim_tokens
  description = "The dkim_tokens of aws_ses_domain_dkim"
}