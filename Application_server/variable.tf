variable "aws_region" {
  description = "AWS region to create resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-03f3a22c5f8f5ef58"
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}