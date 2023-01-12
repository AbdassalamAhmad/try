resource "aws_key_pair" "ssh_key_variable" {
  key_name   = var.key_name
  public_key = var.public_key
}