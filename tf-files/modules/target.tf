resource "aws_alb_target_group" "app-lb-tg" {
  name = "phonebook-lb-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = data.aws_vpc.selected.id
  target_type = "instance"

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 3
  }
}