resource "aws_alb" "app-lb" {
  name = "phonebook-lb-tf"
  ip_address_type = "ipv4"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb-sg.id]
  subnets = data.aws_subnets.pb-subnets.ids
}

resource "aws_alb_listener" "app-listener" {
  load_balancer_arn = aws_alb.app-lb.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_alb_target_group.app-lb-tg.arn
  }
}