output "certificate_arn" {
  description = "Cert ARN"
  value       = aws_acm_certificate_validation.bank.certificate_arn
}
