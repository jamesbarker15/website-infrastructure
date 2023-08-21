resource "aws_key_pair" "web-key" {
  key_name   = "web-key"
  public_key = file("mykey.pub")
  tags       = local.common_tags
}