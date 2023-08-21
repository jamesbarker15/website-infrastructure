output "dns_address" {
  value = aws_lb.web-lb.dns_name
}

output "ip_address_1" {
  value = aws_instance.webserver1.public_ip
}

output "ip_address_2" {
  value = aws_instance.webserver2.public_ip
}