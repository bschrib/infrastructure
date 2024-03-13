variable "domain" {
  description = "A domain with whom to setup an AWS SES domain identity and domain DKIM"
  nullable    = false
  type        = string
}

variable "aws_region" {
  description = "The AWS region where SES is to be deployed"
  type        = string
  default     = "us-east-2"
}