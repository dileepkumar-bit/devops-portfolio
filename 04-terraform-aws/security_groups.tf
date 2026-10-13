resource "aws_security_group" "web" {
  name        = "${var.project_name}-web-sg"
  description = "Allow SSH only from the approved public IP"
  vpc_id      = aws_vpc.main.id

  # SSH rule: restricted to your approved public IP
  ingress {
    description = "SSH from approved public IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  # HTTP rule: allows public website access
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "${var.project_name}-web-sg"
    Project   = var.project_name
    ManagedBy = "Terraform"
  }
}
