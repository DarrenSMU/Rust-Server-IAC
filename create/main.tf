// Create EC2 private security group
resource "aws_security_group" "rust_sg" {
  name        = "rust_sg"
  description = "Allow SSH from my house and allow players through Rust ports only"
  // Use default VPC

  ingress {
    from_port   = 22
    protocol    = "TCP"
    to_port     = 22
    cidr_blocks = [var.private_ip_address]
    description = "Only allow own IP address to access instance"
  }
  ingress {
    from_port   = 28015
    protocol    = "UDP"
    to_port     = 28015
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow players to connect to game server"
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}

// ssh key
resource "aws_key_pair" "rust_main_key" {
  key_name   = "rust_main_key"
  public_key = var.public_key
}


// Launch EC2 Instance
resource "aws_instance" "rust-main" {
  ami                    = var.ec2_ami
  instance_type          = var.ec2_instance_type
  vpc_security_group_ids = [aws_security_group.rust_sg.id]
  key_name = aws_key_pair.rust_main_key.id
  
  root_block_device {
    volume_size = var.ec2_volume_size
  }

  tags = {
    Name = "Rust Main"
  }
}

output "ec2_global_ips" {
  value = ["${aws_instance.rust-main.public_ip}"]
}
  