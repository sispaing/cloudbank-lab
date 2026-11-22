output "bastion_public_ip" {
  description = "Bastion public IP"
  value       = module.compute.bastion_public_ip
}

output "private_ips" {
  description = "Private IPs of all instances"
  value       = module.compute.private_ips
}

output "bank_url" {
  description = "Bank URL"
  value       = "https://${module.dns.bank_fqdn}"
}

output "cp_alb_dns_name" {
  description = "cp-alb DNS name"
  value       = module.alb.cp_alb_dns_name
}
