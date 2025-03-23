provider "aws" {
  region = var.aws_region
}

# Create VPC
resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}

# Create Subnet in VPC
resource "aws_subnet" "main" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "172.31.1.0/24"
  map_public_ip_on_launch = true
  availability_zone        = "us-east-1a"

  tags = {
    Name = "main-subnet"
  }
}

# Create Security Group with firewall rules
resource "aws_security_group" "new-terraform-sg" {
  name        = var.security_group
  description = "Security group for Jenkins"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Restrict RDP access to a specific IP (replace YOUR_IP)
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.allowed_ips
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

# Create EC2 Instance
resource "aws_instance" "terraform-ec2" {
  count                  = var.INSTANCE_COUNT
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.new-terraform-sg.id]
  subnet_id              = aws_subnet.main.id  # <-- Subnet added

  tags = {
    Name = var.tag_name
  }
}
