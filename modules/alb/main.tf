resource "aws_lb_target_group" "stmt" {
  name     = "stmt-tg"
  port     = 9093
  protocol = "HTTP"
  vpc_id   = var.statement_vpc_id

  health_check {
    path    = "/health"
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "stmt" {
  for_each = var.stmt_instance_ids

  target_group_arn = aws_lb_target_group.stmt.arn
  target_id        = each.value
}

resource "aws_lb" "stmt" {
  name               = "stmt-alb"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.statement_subnet_ids
  security_groups    = [var.stmt_alb_sg_id]
}

resource "aws_lb_listener" "stmt_8083" {
  load_balancer_arn = aws_lb.stmt.arn
  port              = 8083
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.stmt.arn
  }
}

resource "aws_lb_target_group" "acc" {
  name     = "acc-tg"
  port     = 9092
  protocol = "HTTP"
  vpc_id   = var.account_vpc_id

  health_check {
    path    = "/health"
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "acc" {
  for_each = var.acc_instance_ids

  target_group_arn = aws_lb_target_group.acc.arn
  target_id        = each.value
}

resource "aws_lb" "acc" {
  name               = "acc-lb"
  internal           = true
  load_balancer_type = "application"
  subnets            = var.account_subnet_ids
  security_groups    = [var.acc_alb_sg_id]
}

resource "aws_lb_listener" "acc_8082" {
  load_balancer_arn = aws_lb.acc.arn
  port              = 8082
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.acc.arn
  }
}

resource "aws_lb_target_group" "cp" {
  name     = "cp-tg"
  port     = 9091
  protocol = "HTTP"
  vpc_id   = var.customer_profile_vpc_id

  health_check {
    path    = "/health"
    matcher = "200"
  }
}

resource "aws_lb_target_group_attachment" "cp" {
  for_each = var.cp_instance_ids

  target_group_arn = aws_lb_target_group.cp.arn
  target_id        = each.value
}

resource "aws_lb" "cp" {
  name               = "cp-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.customer_profile_subnet_ids
  security_groups    = [var.cp_alb_sg_id]
}

resource "aws_lb_listener" "cp_8081" {
  load_balancer_arn = aws_lb.cp.arn
  port              = 8081
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cp.arn
  }
}

resource "aws_lb_listener" "cp_443" {
  load_balancer_arn = aws_lb.cp.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.cp.arn
  }
}

resource "aws_lb_listener" "cp_80" {
  load_balancer_arn = aws_lb.cp.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}
