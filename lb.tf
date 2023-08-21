resource "aws_lb" "web-lb" {
  name                       = "web-lb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.web-lb-sg.id]
  subnets                    = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id, aws_subnet.main-public-3.id]
  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb-listener" {
  load_balancer_arn = aws_lb.web-lb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-tg.arn
  }
}