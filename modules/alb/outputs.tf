output "cp_alb_dns_name" {
  value = aws_lb.cp.dns_name
}

output "cp_alb_zone_id" {
  value = aws_lb.cp.zone_id
}

output "acc_lb_dns_name" {
  value = aws_lb.acc.dns_name
}

output "acc_lb_zone_id" {
  value = aws_lb.acc.zone_id
}

output "stmt_alb_dns_name" {
  value = aws_lb.stmt.dns_name
}

output "stmt_alb_zone_id" {
  value = aws_lb.stmt.zone_id
}
