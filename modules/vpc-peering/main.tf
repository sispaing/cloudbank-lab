resource "aws_vpc_peering_connection" "cp_acc" {
  vpc_id      = var.customer_profile_vpc_id
  peer_vpc_id = var.account_vpc_id
  auto_accept = true

  tags = {
    Name = var.cp_acc_peering_name
  }
}

resource "aws_vpc_peering_connection" "acc_stmt" {
  vpc_id      = var.account_vpc_id
  peer_vpc_id = var.statement_vpc_id
  auto_accept = true

  tags = {
    Name = var.acc_stmt_peering_name
  }
}

resource "aws_route" "cp_to_acc" {
  count = length(var.customer_profile_route_table_ids)

  route_table_id            = var.customer_profile_route_table_ids[count.index]
  destination_cidr_block    = var.account_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.cp_acc.id
}

resource "aws_route" "acc_to_cp" {
  count = length(var.account_route_table_ids)

  route_table_id            = var.account_route_table_ids[count.index]
  destination_cidr_block    = var.customer_profile_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.cp_acc.id
}

resource "aws_route" "acc_to_stmt" {
  count = length(var.account_route_table_ids)

  route_table_id            = var.account_route_table_ids[count.index]
  destination_cidr_block    = var.statement_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.acc_stmt.id
}

resource "aws_route" "stmt_to_acc" {
  count = length(var.statement_route_table_ids)

  route_table_id            = var.statement_route_table_ids[count.index]
  destination_cidr_block    = var.account_vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.acc_stmt.id
}
