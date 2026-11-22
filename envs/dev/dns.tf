module "acm" {
  source = "../../modules/acm"

  zone_name = var.zone_name
}

module "dns" {
  source = "../../modules/dns"

  zone_name = var.zone_name

  cp_alb_dns_name   = module.alb.cp_alb_dns_name
  cp_alb_zone_id    = module.alb.cp_alb_zone_id
  acc_lb_dns_name   = module.alb.acc_lb_dns_name
  acc_lb_zone_id    = module.alb.acc_lb_zone_id
  stmt_alb_dns_name = module.alb.stmt_alb_dns_name
  stmt_alb_zone_id  = module.alb.stmt_alb_zone_id
}
