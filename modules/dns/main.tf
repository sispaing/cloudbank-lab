data "aws_route53_zone" "this" {
  name         = var.zone_name
  private_zone = false
}

resource "aws_route53_record" "bank" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${var.bank_subdomain}.${var.zone_name}"
  type    = "A"

  alias {
    name                   = var.cp_alb_dns_name
    zone_id                = var.cp_alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "account" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "account.internal.${var.zone_name}"
  type    = "A"

  alias {
    name                   = var.acc_lb_dns_name
    zone_id                = var.acc_lb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "statement" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "statement.internal.${var.zone_name}"
  type    = "A"

  alias {
    name                   = var.stmt_alb_dns_name
    zone_id                = var.stmt_alb_zone_id
    evaluate_target_health = true
  }
}
