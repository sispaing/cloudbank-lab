data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
}

locals {
  cp_instances = {
    cp1 = var.customer_profile_subnet_ids[0]
    cp2 = var.customer_profile_subnet_ids[1]
  }

  acc_instances = {
    acc1 = var.account_subnet_ids[0]
    acc2 = var.account_subnet_ids[1]
  }

  stmt_instances = {
    stmt1 = var.statement_subnet_ids[0]
    stmt2 = var.statement_subnet_ids[1]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.customer_profile_subnet_ids[0]
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true

  tags = { Name = "bastion" }
}

resource "aws_instance" "cp" {
  for_each = local.cp_instances

  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = each.value
  vpc_security_group_ids      = [var.cp_ec2_sg_id]
  associate_public_ip_address = false

  user_data                   = var.cp_user_data
  user_data_replace_on_change = true

  tags = { Name = each.key }
}

resource "aws_instance" "acc" {
  for_each = local.acc_instances

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = each.value
  vpc_security_group_ids = [var.acc_ec2_sg_id]

  user_data                   = var.acc_user_data
  user_data_replace_on_change = true

  tags = { Name = each.key }
}

resource "aws_instance" "stmt" {
  for_each = local.stmt_instances

  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = each.value
  vpc_security_group_ids = [var.stmt_ec2_sg_id]

  user_data                   = var.stmt_user_data
  user_data_replace_on_change = true

  tags = { Name = each.key }
}
