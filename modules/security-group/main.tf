resource "aws_security_group" "bastion" {
  name        = "bastion-sg"
  description = "SSH from my IP"
  vpc_id      = var.customer_profile_vpc_id

  ingress {
    description = "SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "bastion-sg" }
}

resource "aws_security_group" "cp_alb" {
  name        = "cp-alb-sg"
  description = "cp-alb"
  vpc_id      = var.customer_profile_vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP test port"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "cp-alb-sg" }
}

resource "aws_security_group" "cp_ec2" {
  name        = "cp-ec2-sg"
  description = "cp instances"
  vpc_id      = var.customer_profile_vpc_id

  ingress {
    description = "App port"
    from_port   = 9091
    to_port     = 9091
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    description = "SSH from bastion"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.customer_profile_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "cp-ec2-sg" }
}

resource "aws_security_group" "acc_alb" {
  name        = "acc-alb-sg"
  description = "acc-lb"
  vpc_id      = var.account_vpc_id

  ingress {
    description = "From cp VPC"
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = [var.customer_profile_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "acc-alb-sg" }
}

resource "aws_security_group" "acc_ec2" {
  name        = "acc-ec2-sg"
  description = "acc instances"
  vpc_id      = var.account_vpc_id

  ingress {
    description = "All from lab VPCs"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "acc-ec2-sg" }
}

resource "aws_security_group" "stmt_alb" {
  name        = "stmt-alb-sg"
  description = "stmt-alb"
  vpc_id      = var.statement_vpc_id

  ingress {
    description = "From acc VPC"
    from_port   = 8083
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = [var.account_vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "stmt-alb-sg" }
}

resource "aws_security_group" "stmt_ec2" {
  name        = "stmt-ec2-sg"
  description = "stmt instances"
  vpc_id      = var.statement_vpc_id

  ingress {
    description = "All from lab VPCs"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "stmt-ec2-sg" }
}
