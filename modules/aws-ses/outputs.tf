output "ses_domain_identity_arn" {
  value       = aws_ses_domain_identity.domain_identity.arn
  description = "The ARN of the SES domain identities"
}

output "ses_domain_identity_verification_token" {
  value       = aws_ses_domain_identity.domain_identity.verification_token
  description = "The verification token for the SES domain identities"
}

output "ses_domain_dkim_tokens" {
  value       = aws_ses_domain_dkim.domain_dkim.dkim_tokens
  description = "The DKIM tokens for the SES domain DKIM setups"
}

output "smtp_credentials" {
  value = {
    username  = aws_iam_user.ses_smtp_user.name
    password  = aws_iam_access_key.ses_smtp_user_key.secret
    endpoint  = "email-smtp.${var.aws_region}.amazonaws.com"
  }
  description = "SMTP credentials for the domain."
  sensitive   = true
}
