data "aws_route53_zone" "this" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_acm_certificate" "bank" {
  domain_name       = "${var.bank_subdomain}.${var.zone_name}"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }

  tags = { Name = "${var.bank_subdomain}.${var.zone_name}" }
}

resource "aws_route53_record" "validation" {
  for_each = {
    for dvo in aws_acm_certificate.bank.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      record = dvo.resource_record_value
    }
  }

  zone_id         = data.aws_route53_zone.this.zone_id
  name            = each.value.name
  type            = each.value.type
  records         = [each.value.record]
  ttl             = 60
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "bank" {
  certificate_arn         = aws_acm_certificate.bank.arn
  validation_record_fqdns = [for r in aws_route53_record.validation : r.fqdn]
}
