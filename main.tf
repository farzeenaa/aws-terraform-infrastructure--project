terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# 1. Automatically import your AWS account's built-in default VPC network
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# 2. Create a Security Group (Virtual Firewall) directly inside the open Default VPC
resource "aws_security_group" "web_sg" {
  name        = "resume-web-sg"
  description = "Allow inbound HTTP web traffic"
  vpc_id      = aws_default_vpc.default.id # Attaching firewall to the open default network

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "resume-web-sg"
  }
}

# 3. Launch your Virtual Compute Server on the verified public network
resource "aws_instance" "web_server" {
  ami                    = "ami-0e2c8caa4b6378d8c" # Verified Official Ubuntu 24.04 LTS Image
  instance_type          = "t2.micro"             # Free-tier eligible sizing
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Automated startup bash script to launch Apache server engine
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update -y
              sudo apt-get install -y apache2
              sudo systemctl start apache2
              sudo systemctl enable apache2
              echo "<h1>My Resume Portfolio Project built using Terraform!</h1>" | sudo tee /var/www/html/index.html
              EOF

  tags = {
    Name = "resume-web-server"
  }
}

# 4. Stream your server's public IP connection handle to the terminal logs
output "server_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "The public IP address of your web server"
}
