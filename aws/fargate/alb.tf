resource "aws_lb" "main" {
  name               = "cb-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.public.*.id
  security_groups    = [for subnet in aws_subnet.public : subnet.id]
}

resource "aws_lb_target_group" "app" {
  name        = "cb-target-group"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = local.app.health_check
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the LB to the target group
resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.main.id
  port              = local.app.port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app.id
    type             = "forward"
  }
}

resource "aws_lb_listener" "secure" {
  load_balancer_arn = aws_lb.main.id
  port              = 443
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app.id
    type             = "forward"
  }
}
