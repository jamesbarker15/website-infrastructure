resource "aws_instance" "webserver1" {
  ami             = "ami-01dd271720c1ba44f"
  instance_type   = "t2.micro"
  key_name        = "web-key"
  security_groups = [aws_security_group.web-sg.id]
  tags            = local.common_tags
  subnet_id       = aws_subnet.main-public-1.id
  user_data       = <<-EOF
              #!/bin/bash
              apt update
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo 'this is site 1' > /var/www/html/index.html
              EOF
}

resource "aws_instance" "webserver2" {
  ami             = "ami-01dd271720c1ba44f"
  instance_type   = "t2.micro"
  key_name        = "web-key"
  security_groups = [aws_security_group.web-sg.id]
  tags            = local.common_tags
  subnet_id       = aws_subnet.main-public-2.id
  user_data       = <<-EOF
              #!/bin/bash
              apt update
              apt install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo 'this is site 2' > /var/www/html/index.html
              EOF
}