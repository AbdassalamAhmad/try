resource "aws_key_pair" "ssh_key_variable" {
  key_name   = "bastion.pem"
  public_key = var.public_key
}