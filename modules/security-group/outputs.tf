output "bastion_sg_id" {
  value = aws_security_group.bastion.id
}

output "cp_alb_sg_id" {
  value = aws_security_group.cp_alb.id
}

output "cp_ec2_sg_id" {
  value = aws_security_group.cp_ec2.id
}

output "acc_alb_sg_id" {
  value = aws_security_group.acc_alb.id
}

output "acc_ec2_sg_id" {
  value = aws_security_group.acc_ec2.id
}

output "stmt_alb_sg_id" {
  value = aws_security_group.stmt_alb.id
}

output "stmt_ec2_sg_id" {
  value = aws_security_group.stmt_ec2.id
}
