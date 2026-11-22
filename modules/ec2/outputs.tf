output "bastion_public_ip" {
  description = "Bastion public IP"
  value       = aws_instance.bastion.public_ip
}

output "cp_instance_ids" {
  value = { for name, inst in aws_instance.cp : name => inst.id }
}

output "acc_instance_ids" {
  value = { for name, inst in aws_instance.acc : name => inst.id }
}

output "stmt_instance_ids" {
  value = { for name, inst in aws_instance.stmt : name => inst.id }
}

output "private_ips" {
  value = merge(
    { bastion = aws_instance.bastion.private_ip },
    { for name, inst in aws_instance.cp : name => inst.private_ip },
    { for name, inst in aws_instance.acc : name => inst.private_ip },
    { for name, inst in aws_instance.stmt : name => inst.private_ip },
  )
}
