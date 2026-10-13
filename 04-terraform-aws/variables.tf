variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Name used to identify this Terraform project"
  type        = string
  default     = "devops-terraform"
}

variable "vpc_cidr" {
  description = "CIDR range for the project VPC"
  type        = string
  default     = "10.20.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.20.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type for the web server"
  type        = string
  default     = "t3.micro"
}

variable "instance_name" {
  description = "Name of the EC2 web server"
  type        = string
  default     = "terraform-web-server"
}

variable "allowed_ssh_cidr" {
  description = "Public IP allowed to SSH into the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Existing EC2 key pair name for SSH access"
  type        = string
  default     = "project04-linux-key"
}
