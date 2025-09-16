# Security group allowing SSH only from your IP
resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh_from_my_ip"
  description = "Allow SSH inbound from my public IP only"

  ingress {
    description      = "SSH from my IP"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["<YOUR_PUBLIC_IP>/32"]   # Replace with your public IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"  # All outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 instance with the security group attached
resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316"  # Example: Amazon Linux 2 in us-east-1, replace as needed
  instance_type = "t2.micro"

  security_groups = [aws_security_group.ssh_access.name]

  tags = {
    Name = "Terraform-EC2-Instance"
  }
}
