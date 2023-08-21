resource "aws_security_group" "web-lb-sg" {
  name   = "web-lb-sg"
  vpc_id = aws_vpc.main.id
  tags   = local.common_tags

  dynamic "ingress" {
    for_each = var.lb-ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
