variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-03f3a22c5f8f5ef"
}


variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}