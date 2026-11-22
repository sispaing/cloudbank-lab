output "cp_acc_peering_id" {
  description = "cp-acc peering ID"
  value       = aws_vpc_peering_connection.cp_acc.id
}

output "acc_stmt_peering_id" {
  description = "acc-stmt peering ID"
  value       = aws_vpc_peering_connection.acc_stmt.id
}
