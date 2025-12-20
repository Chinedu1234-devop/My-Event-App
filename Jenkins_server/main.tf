variable "allowed_ssh_cidr" {
  description = "CIDR block allowed for SSH access"
  type        = string
  default     = "0.0.0.0/0"
}


resource "aws_security_group" "instance_sg" {
  name        = "jenkins-instance-sg"
  description = "Security group for EC2 instance"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "TCP"
    from_port   = 8080
    to_port     = 8080
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
    Name = "jenkins-sg"
  }
}

resource "aws_instance" "myeventapp" {
  ami                         = "ami-099400d52583dd8c4"
  instance_type               = "c7i-flex.large"
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = true



  user_data = <<EOF
#!/bin/bash
sudo yum update –y
sudo wget -O /etc/yum.repos.d/jenkins.repo \    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
sudo yum install java-21-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
sudo yum install -y git
sudo yum install -y docker
sudo service docker start
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins
EOF
  tags = {
    Name = "jenkins-server-instance"
  }
}

