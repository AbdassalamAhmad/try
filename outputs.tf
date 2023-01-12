output "bastion_public_ip" {
  value = aws_instance.bastion_instance_1.public_ip
  #sensitive = true
}