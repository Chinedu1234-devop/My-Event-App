data "aws_vpc" "default" {
  default = true
}

resource "aws_instance" "myeventapp" {
  ami                         = "ami-03f3a22c5f8f5ef58"
  instance_type               = "t3.micro"
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true
  key_name = "mykey"
  tags = {
    Name = "my-event-app-instance"
  }

}

resource "aws_security_group" "instance_sg" {
  name        = "application-server-sg"
  description = "Security group for EC2 instance"
  vpc_id      = data.aws_vpc.default.id


  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Application port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Application port 5000"
    from_port   = 5000
    to_port     = 5000
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
    Name = "application-sg"
  }
}

