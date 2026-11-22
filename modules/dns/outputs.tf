output "bank_fqdn" {
  value = aws_route53_record.bank.fqdn
}

output "account_fqdn" {
  value = aws_route53_record.account.fqdn
}

output "statement_fqdn" {
  value = aws_route53_record.statement.fqdn
}
