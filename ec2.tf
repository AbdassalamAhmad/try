resource "aws_instance" "bastion_instance_1" {
  ami                         = var.ami
  instance_type               = "t3.micro"
  availability_zone           = "eu-south-1a"


  associate_public_ip_address = true
  tags = {
    Name = "Bastion"
  }


  user_data = <<-EOF
    #!/bin/bash
    # Use this for your user data (script from top to bottom)
    # install httpd (Linux 2 version)
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
    EOF
}