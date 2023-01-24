resource "aws_instance" "bastion_instance_1" {
  ami                         = "ami-0185600d76ba787f4" 
  instance_type               = var.ec2_type
  availability_zone           = "eu-south-1a"
  key_name                    = aws_key_pair.ssh_key_variable.key_name
  vpc_security_group_ids      = [aws_security_group.BastionSG.id]

  associate_public_ip_address = true
  tags = {
    Name = "Bastion"
  }


  # user_data = <<-EOF
  #   #!/bin/bash
  #   # Use this for your user data (script from top to bottom)
  #   # install httpd (Linux 2 version)
  #   yum update -y
  #   yum install -y httpd
  #   systemctl start httpd
  #   systemctl enable httpd
  #   echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
  #   EOF
}

resource "aws_security_group" "BastionSG" {
  name = "bastion_security_group"


  ingress {
    description = "allow ssh from ALL"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow http from ALL"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
