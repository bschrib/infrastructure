resource "aws_ses_domain_identity" "domain_identity" {
  domain = var.domain
}

resource "aws_ses_domain_dkim" "domain_dkim" {
  domain = var.domain
}

resource "aws_iam_user" "ses_smtp_user" {
  name = "${var.domain}-ses-smtp-user"
}

resource "aws_iam_access_key" "ses_smtp_user_key" {
  user = aws_iam_user.ses_smtp_user.name
}

resource "aws_iam_policy" "ses_send_email_policy" {
  name        = "${var.domain}-ses-send-email-policy"
  description = "Policy for ${var.domain} SES SMTP user to send emails."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ses:SendRawEmail"]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_user_policy_attachment" "ses_smtp_user_policy_attachment" {
  user       = aws_iam_user.ses_smtp_user.name
  policy_arn = aws_iam_policy.ses_send_email_policy.arn
}
